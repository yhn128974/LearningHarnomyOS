import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebCase {
  @State message: string = 'Hello World';
  controller: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      // web默认禁止了浏览器的页面存储变化
      Web({
        src: "file://" + getContext().filesDir + "/toutiao/index.html",
        controller: this.controller
      })
        .domStorageAccess(true)//解决页面不能存储化的问题
        .width('100%')
        .height('100%')
    }
  }
}