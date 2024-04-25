@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        LoadingProgress()
          .color(Color.Blue)
          .height(60)
          .width(60)
      }
      .width('100%')
    }
    .height('100%')
  }
}

