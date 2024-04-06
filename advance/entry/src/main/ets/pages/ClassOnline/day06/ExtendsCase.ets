@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message).TextStyle(Color.Pink)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function TextStyle(backgroundColor:Color) {
  .fontSize(50)
  .fontWeight(FontWeight.Bold)
  .backgroundColor(backgroundColor)
}

