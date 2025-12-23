@Entry
@Component
struct BaiduPage {
  @State message: string = 'Hello World';

  build() {
    Column({}) {
      Image("../../../resources/base/media/startIcon.png")
        .height(40)
        .border({
          width: 1
        }).width('100%')
      Row() {
        TextInput()
          .layoutWeight(1)
          .border({
            width: {
              left: 2,
              top: 2,
              bottom: 2,
              right: 2
            },
            color: "#ccc"
          })
          .borderRadius({
            topLeft: 10,
            bottomLeft: 10,
          })
          .height(60)

        Button('Bing').onClick((event: ClickEvent) => {

        }).type(ButtonType.Normal).height(60)
          .borderRadius({
            topRight: 10,

            bottomRight: 10,
          })
      }.padding(10)

    }
    .height('100%')
    .width('100%')
  }
}