@Component
export struct Footer {
  build() {
    Row() {

        Row().width(100).backgroundColor(Color.White).height(40)
        Row().width(100).backgroundColor(Color.White).height(40)
        Row().width(100).backgroundColor(Color.White).height(40)
      }.backgroundColor(Color.Red).height(60).width('100%').justifyContent(FlexAlign.SpaceEvenly)

  }
}