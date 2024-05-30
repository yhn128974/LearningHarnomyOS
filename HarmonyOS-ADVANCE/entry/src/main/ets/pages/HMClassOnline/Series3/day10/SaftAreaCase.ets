import { window } from '@kit.ArkUI';

@Entry
@Component
struct SaftAreaCase {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    // 页面开启沉浸式
    window.getLastWindow(getContext()).then((win) => {
      win.setWindowLayoutFullScreen(false)
      // 获取上方安全性高度(px)
      let sysTopheight = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        .topRect
        .height)
      // 获取下方安全性高度(px)
      let sysBottomheight = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        .bottomRect
        .height)
    })

  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.3')).width('100%').height('100%')// 组件开启沉浸式
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      }
      .width('100%')
    }
    .height('100%')
  }
}