import { request, zlib } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { fileIo } from '@kit.CoreFileKit';


@Entry
@ComponentV2
struct Fileage {
  @Local downUrl: string = 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip';
  @Local current: number = 0
  @Local total: number = 0
  @Local showWeb: boolean = false;
  //展示网页需要初始化一个网页的控制器
  webController: WebviewController = new webview.WebviewController()

  aboutToAppear(): void {
    if (fileIo.listFileSync(this.getUIContext().getHostContext()?.filesDir).includes('tuoTiao.zip')
    ) {
      this.showWeb = true
    } else {
      this.downLoad()
    }

  }

  //下载步骤
  async downLoad() {
    //获取文件路径
    const filePath = this.getUIContext().getHostContext()?.filesDir + '/tuoTiao.zip'
    //创建下载任务
    const task = await request.downloadFile(this.getUIContext().getHostContext(), {
      url: this.downUrl,
      filePath: filePath
    }).then((downloadTask: request.DownloadTask,) => {
      //监听下载进度
      downloadTask.on('progress', (current, total) => {
        this.current = current
        this.total = total
      })
      downloadTask.on('fail', () => {
        promptAction.openToast({
          message: "loading fail"
        })
      })
      downloadTask.on('complete', () => {

        promptAction.openToast({
          message: "loading success"
        })
        this.decompressFile(filePath)

      })
    })
  }

  //解压步骤
  async decompressFile(filePath: string) {
    try {
      //zlib.decompressFile解压缩
      await zlib.decompressFile(filePath, getContext().filesDir)
      this.showWeb = true
    } catch (error) {
      AlertDialog.show({
        message: error.message
      })
    }
  }

  build() {
    Column() {

      // Button('start to downloading').onClick(() => {
      //   this.downLoad()
      // })
      //展示网页，混合开发
      if (this.showWeb) {
        Web({
          // src: "http://www.bilibili.com",
          src: 'file://' + this.getUIContext().getHostContext()?.filesDir + '/toutiao/index.html',
          controller: this.webController
        })
        //本地网页要加载需要这两个属性授权：domStorageAccess，fileAccess
          .domStorageAccess(true)
          .fileAccess(true)
      } else {
        Progress({
          value: this.current!!,
          total: this.total!!
        })
      }

    }
    .height('100%')
    .width('100%')
  }
}