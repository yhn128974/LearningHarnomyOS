@Entry
@Component
struct setWindowsLayoutFullScreen {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Image($r('app.media.banner_01_1'))
          .width('100%')
          .height('100%')
            // 扩展至全屏的第三种方式
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      }
      .width('100%')
    }
    .height('100%')
  }
}

