// entry/src/main/ets/pages/IndexSec.ets
import { MainPage, LibraryLog, func, ResManager } from 'library1';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      // Har页面
      MainPage().height('50%')

      Text(this.message)
        .fontFamily('HarmonyHeiTi')
        .fontWeight(FontWeight.Bold)
        .fontSize(32)
        .fontWeight(700)
        .fontColor($r('app.color.text_color'))
        .textAlign(TextAlign.Start)
        .margin({ top: '32px' })
        .width('624px')

      //引用HAR的ts类和方法
      Button($r('app.string.button'))
        .id('button')
        .height(48)
        .width('624px')
        .margin({ top: '4%' })
        .type(ButtonType.Capsule)
        .fontFamily('HarmonyHeiTi')
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('app.color.button_background'))
        .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .fontSize($r('sys.float.ohos_id_text_size_button1'))
        .onClick(() => {
          // 引用HAR的类和方法
          LibraryLog.info('har msg');
          this.message = 'func return: ' + func();
        })

      Divider()
      // 引入本地har资源
      Text($r('app.string.hello_har'))
      Text(ResManager.getDesc())
    }
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .height('100%')
  }
}