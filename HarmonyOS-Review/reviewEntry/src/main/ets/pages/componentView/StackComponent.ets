@Entry
@Component
struct StackComponent {
  @State message: string = 'Hello World';

  build() {
    Stack({
      alignContent: Alignment.TopStart
    }) {
      Row() {

      }.width(300).height(300).backgroundColor(Color.Red)

      Row() {

      }.width(250).height(250).backgroundColor(Color.Yellow)

      Row() {

      }
      .width(200)
      .height(200)
      .backgroundColor(Color.Orange)
      .margin({
        top: 20
      })
      .offset({
        left: 10
      })
    }
    .height('100%')
    .width('100%')
  }
}