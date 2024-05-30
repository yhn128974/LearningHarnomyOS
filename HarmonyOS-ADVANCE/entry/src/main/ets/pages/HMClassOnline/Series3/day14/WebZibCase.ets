import { webview } from '@kit.ArkWeb'

interface res {
  url: string;
  message: string;
  result: JsResult;
}

@Entry
@Component
struct WebCase {
  webController: webview.WebviewController = new webview.WebviewController()

  aboutToAppear() {
    // 配置Web开启调试模式
    // .WebviewController.setWebDebuggingAccess(true);
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  build() {
    Column() {
      Web({
        controller: this.webController,
        src: "file://" + getContext().filesDir + '/toutiao/index.html'
      })
        .domStorageAccess(true)
        .width('100%')
        .height("100%")
    }
    .width("100%")
    .height('100%')

  }
}