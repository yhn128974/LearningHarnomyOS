import { UserModel } from "../../../models"
import { QuestionDetail } from "../../../models/QuestionDetail"
import { author } from "../../../commons/utils/Author"
import { componentSnapshot, promptAction } from "@kit.ArkUI"
import { image } from "@kit.ImageKit"
import { fileIo, fileUri } from "@kit.CoreFileKit"
import { photoAccessHelper } from "@kit.MediaLibraryKit"
import { apiGetQuesListDetail } from "../../../commons/utils/http/api"
import { navPathStack } from "../../../commons/utils"
import { QuestionPageParams } from "../../../models/QuestionPageParams"
import { scanBarcode } from "@kit.ScanKit"


@CustomDialog
export struct QuestionShareDialog {
  //
  @Prop item: QuestionDetail
  localSnapshot: image.PixelMap | ResourceStr = ''
  user: UserModel = author.getUserInfo()
  controller: CustomDialogController

  //
  async saveImage() {
    //组件截图=>得到一种 pixelMap的格式
    const snapshot = await componentSnapshot.getSync('share')
    //转化为二进制数据存入沙箱
    // 图片选择器
    const imagePacker = image.createImagePacker()
    //转化为二进制
    const arrayBuffer = await imagePacker.packToData(
      snapshot,
      {
        format: 'image/jpeg',
        quality: 98
      })
    //得到全局的context
    const context = this.getUIContext().getHostContext()
    //生成响应的缓存目录
    const imagePath = context?.cacheDir! + Date.now() + '.jpeg'
    //生成文件专属ID
    const fileID = fileIo.openSync(imagePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE).fd
    //执行写入和关闭
    fileIo.write(fileID, arrayBuffer)
    fileIo.close(fileID)
    //写入相册
    //获取完整的图片路径
    const uri = fileUri.getUriFromPath(imagePath)
    //创建图片改变请求
    const imageChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(context, uri)
    //请求导入context
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context)
    //
    await phAccessHelper.applyChanges(imageChangeRequest)

    this.localSnapshot = snapshot

    this.controller.close()

    promptAction.openToast({
      message: "save to alum was success "
    })
  }

  async handleScan() {
    if (canIUse('SystemCapability.Multimedia.Scan.ScanBarcode')) {
      //开始扫描二维码
      const result = await scanBarcode.startScanForResult(getContext(this))
      // {"scanType":11,"originalValue":"37214"}
      if (result.originalValue) {
        try {
          const item = await apiGetQuesListDetail(result.originalValue)
          navPathStack.pushPath({
            name: 'QuestionPage',
            param: {
              item,
              list: [item]
            } as QuestionPageParams
          })
        } catch (e) {
          promptAction.showToast({ message: '没有找到试题' })
        }
      }
    }
  }

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column({ space: 20 }) {
        Image($r('app.media.ic_interview_logo'))
          .width(40)
          .height(40)
        Text('面试通，搞定企业面试题')
        Divider()
          .strokeWidth(0.5)
          .color($r('app.color.common_gray_border'))
        Text('大厂面试题：' + this.item.stem)
          .fontSize(12)
          .maxLines(2)
          .fontWeight(600)
          .width('100%')
          .lineHeight(24)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        QRCode(this.item.id.toString())
          .width(160)
          .height(160)
          .alignSelf(ItemAlign.Center)
        Text('扫码查看答案')
          .fontSize(12)
          .alignSelf(ItemAlign.Center)
          .onClick(() => {
            this.handleScan()
          })

        Blank()
        Text('分享来自：' + this.user.nickName || this.user.username)
          .fontSize(12)
      }
      .id('share')
      .padding(20)
      .alignItems(HorizontalAlign.Start)
      .width(300)
      .height(500)
      .backgroundColor($r('app.color.white'))

      Row() {
        //安全控件
        SaveButton({
          icon: SaveIconStyle.FULL_FILLED,
          text: SaveDescription.SAVE_IMAGE,
          buttonType: ButtonType.Normal
        })
          .onClick((event, res) => {
            //租价截图
            if (res === SaveButtonOnClickResult.SUCCESS) {
              this.saveImage()
            }
          })
          .fontColor($r('app.color.white'))
          .fontSize(14)
          .padding(12)
          .backgroundColor($r('app.color.common_main_color'))
      }
      .borderRadius({ topLeft: 8 })
      .clip(true)
    }
    .borderRadius(8)
    .clip(true)
  }
}