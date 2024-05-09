@Component
export struct Header {
  build() {
    Row(){
      Text('首页').fontSize(20)
    }.width('100%').height(60).justifyContent(FlexAlign.Center).backgroundColor(Color.Red)
  }
}