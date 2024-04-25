@Entry
@Component
struct MeiTuanFooter {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Text('美团底部').fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(60)
    .backgroundColor(Color.Blue)

  }
}

export {
  MeiTuanFooter
}

