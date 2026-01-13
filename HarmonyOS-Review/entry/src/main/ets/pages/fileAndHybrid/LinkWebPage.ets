import { webview } from '@kit.ArkWeb';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

@Entry
@Component
struct LinkWebPage {
  @State message: string = 'Hello World';
  //WebviewController：操作桥梁
  currentWebController: WebviewController = new webview.WebviewController()

  //TODO:混合开发通信
  //1.鸿蒙手机修改网页内容
  //2.网页打开鸿蒙手机的相册
  openAlum(num: number) {
    new photoAccessHelper.PhotoViewPicker().select({
      maxSelectNumber: num
    })
  }

  build() {
    Column() {
      Button(' change web information').onClick(() => {
        //想要操纵网页需要WebviewController.runJavaScript
        this.currentWebController.runJavaScript(`changeText('from app')`)
      })
      Button('open alum').onClick(() => {
        new photoAccessHelper.PhotoViewPicker().select()
      })

      Button('provider function to web').onClick(() => {
        //给个网页发送事件对象
        this.currentWebController.registerJavaScriptProxy({
          'openAlum': (num: number) => {
            this.openAlum(num)
          }, 'openAlum1': () => {

          }
          //必须刷新网页
        }, 'harmoneyOSObj', ['openAlum'])

        // refresh刷新网页后registerJavaScriptProxy注册的对象方法才能使用
        this.currentWebController.refresh()
      })


      Web({
        src: $rawfile('test.html'),
        controller: this.currentWebController
      })        //本地网页要加载需要这两个属性授权：domStorageAccess，fileAccess
        .domStorageAccess(true)
        .fileAccess(true)
    }
    .height('100%')
    .width('100%')
  }
}