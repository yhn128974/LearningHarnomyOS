@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Row() {
        Column({
          space: 10
        }) {
          Text('玩一玩').palyfontSizeStyle()
          Text('簽到兌禮物 | 超多大獎 超好玩').fontColor('#999')
        }.justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start).margin(10)
        Row({
          space: 10
        }) {
          Image($r('app.media.tree')).width(50).backgroundColor('#eee').borderRadius(10)
          Image($r('app.media.ic_arrow_right')).width(40).fillColor('#555')
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .Row2()
    }.justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Top)
    .Row1()
  }

  @Styles
  Row1(){
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')
  }
  @Styles
  Row2(){
    .layoutWeight(1)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .margin(10)
  }
}
@Extend(Text)
function palyfontSizeStyle() {
  .fontSize(30).fontWeight(600)
}




