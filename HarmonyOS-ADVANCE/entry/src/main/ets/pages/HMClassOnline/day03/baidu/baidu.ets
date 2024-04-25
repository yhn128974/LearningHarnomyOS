@Entry
@Component
struct Baidu {

  build() {
    Column({ space: 20 }) {
      Image("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png")
        .width(160)
        .height(80)
      Row() {
        TextInput()
          .borderRadius({
            topLeft: 6,
            bottomLeft: 6
          })
          .height(40)
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .border({
            color: "#c4c7ce",
            width: 2
          })
        Button("百度一下")
          .type(ButtonType.Normal)
          .backgroundColor("#516aee")
          .padding({
            left: 10,
            right: 10,
            top: 6,
            bottom: 6
          })
          .translate({
            x: -2
          })
          .borderRadius({
            topRight: 6,
            bottomRight: 6
          })
      }
      .padding({
        left: 10,
        right: 10
      })
      .width('100%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}