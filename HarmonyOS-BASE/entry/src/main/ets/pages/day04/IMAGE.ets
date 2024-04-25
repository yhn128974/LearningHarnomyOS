@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
       Image($r('app.media.cat'))
        Text($r('app.media.weixin'))
      }
      .width('100%')
    }
    .height('100%')
  }
}

