import { request } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { promptAction, router } from '@kit.ArkUI';
import zlib from '@ohos.zlib';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct HyBirdHotLoad {
  @State message: string = 'Hello World';
  @State showloading: boolean = false;
  @State receivedSize: number = 0
  @State totalSize: number = 0
  @State filePath: string = ''

  // 解压文件
  async thisDecompressFile(filePath: string) {
    let outFileDir = getContext().filesDir
    let options: zlib.Options = {
      level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION
    }

    try {
      await zlib.decompressFile(filePath, outFileDir, options, (errData: BusinessError) => {
        if (errData !== null) {
          console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
        } else {
          promptAction.showToast({
            message: '解压成功！'
          })
          router.pushUrl({
            url: 'pages/HMClassOnline/day19/sandbox/webCase'
          })
        }
      })
    } catch (errData) {
      let code = (errData as BusinessError).code;
      let message = (errData as BusinessError).message;
      console.error(`errData is errCode:${code}  message:${message}`);
    }
  }

  // 下载文件并解压
  async downLoad() {
    this.showloading = true
    const fileName = 'toutiao.zip'
    const filePath = `${getContext().filesDir}/${fileName}`
    // 判断一下，我们的下载的目录是否已经存在
    // file cache temp
    if (fileIo.listFileSync(getContext().filesDir).includes(fileName)) {
      //  存在目录,备份
      await fileIo.renameSync(filePath,`${getContext().filesDir}/toutiao(back).zip`)
      promptAction.showToast({
        message: `rename sucessed`
      })

      this.showloading = false
    } else {
      const task = await request.downloadFile(getContext(), {
        url: 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip',
        filePath
      })
      task.on('progress', (receivedSize: number, totalSize: number) => {
        this.totalSize = totalSize
        this.receivedSize = receivedSize
      })
      task.on('fail', (err: number) => {
        promptAction.showToast({
          message: `${err}`
        })
      })
      task.on('complete', () => {
        this.showloading = false
        promptAction.showToast({
          message: `sucessed`
        })
        this.thisDecompressFile(filePath)

      })
    }
  }

  @Builder
  getContextBuilder() {
    Column() {
      Progress({
        value: this.receivedSize,
        total: this.totalSize
      }).width('100%')
      Text(`${this.receivedSize}/${this.totalSize}`)
    }.width('100%').height('100%').backgroundColor('rgba(0,0,0,0.7)')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('点击热更新').onClick((event: ClickEvent) => {
          this.downLoad()
        })
      }
      .width('100%')
    }
    .height('100%')
    .bindContentCover($$this.showloading, this.getContextBuilder)
  }
}