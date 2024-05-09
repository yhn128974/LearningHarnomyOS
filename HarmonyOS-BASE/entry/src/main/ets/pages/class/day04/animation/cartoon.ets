@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {

        Text()
      }
      .width('100%')
    }
    .height('100%')
  }
}

