@Entry
@Component
struct LayoutWeightAndAspectRatio {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Row(){

        }.width('50%').aspectRatio(1).backgroundColor(Color.Pink)
      }
      .width('100%')
    }
    .height('100%')
  }
}