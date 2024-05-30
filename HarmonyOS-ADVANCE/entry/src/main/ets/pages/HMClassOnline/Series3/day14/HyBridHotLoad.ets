import { request, zlib } from '@kit.BasicServicesKit'
import { fileIo } from '@kit.CoreFileKit'
import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct HyBridHotLoad {
  @State
  showLoading: boolean = false
  @State
  currentValue: number = 0
  @State
  totalValue: number = 0
  @State filePath: string = ''

  async downLoad() {
    this.showLoading = true
    const fileName = "toutiao.zip"

    // 判断一下 我们的目录是否已经有了这个
    const filePath = getContext().filesDir + '/' + fileName
    // file cache temp
    if (fileIo.listFileSync(getContext().filesDir).includes(fileName)) {
      // 沙箱目录下已经有了这个文件
      // 备份
      fileIo.renameSync(filePath, getContext().filesDir + '/toutiao.bak.zip')
    }

    const task = await request.downloadFile(getContext(), {
      url: 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip',
      filePath
    })

    task.on("progress", (current, total) => {
      // 当前
      this.currentValue = current
      // 总计
      this.totalValue = total
    })
    task.on("fail", (error) => {
      AlertDialog.show({ message: error.toString() })
    })
    task.on("complete", () => {
      this.showLoading = false
      promptAction.showToast({ message: '下载成功' })
      this.filePath = filePath
      this.decompressFile()
    })


  }

  // 解压文件
  async decompressFile() {
    try {
      await zlib.decompressFile(this.filePath, getContext().filesDir)
      router.pushUrl({
        url: 'pages/HMClassOnline/Series3/day14/WebZibCase'
      })
    } catch (error) {
      AlertDialog.show({
        message: error.message
      })
    }
  }

  @Builder
  getContent() {
    Column() {
      Progress({
        value: this.currentValue,
        total: this.totalValue
      })
        .width('100%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor("rgba(0,0,0,0.5)")
  }

  build() {
    Column() {
      Text('hello ')
      Row() {

        Column() {
          Button("热更新")
            .onClick(() => {
              this.showLoading = true
              this.downLoad()
            })
        }
        .width('100%')
      }
      .height('100%')
      .bindContentCover($$this.showLoading, this.getContent, {
        modalTransition: ModalTransition.NONE
      })
    }

  }
}