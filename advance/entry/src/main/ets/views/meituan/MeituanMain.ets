@Entry
@Component
struct MeiTuanMain {
  @State message: string = '美团主体';

  build() {
    Row() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%').justifyContent(FlexAlign.Center).layoutWeight(1).backgroundColor(Color.Gray)
  }
}
export{
  MeiTuanMain
}
