@Preview
@Component
struct MTFoodItem {
  build() {
    Row() {
      Image('https://zqran.gitee.io/images/waimai/8078956697.jpg')
        .width(90)
        .aspectRatio(1)
      Column({ space: 5 }) {
        Text('小份酸汤莜面鱼鱼+肉夹馍套餐')
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        Text('酸汤莜面鱼鱼，主料：酸汤、莜面 肉夹馍，主料：白皮饼、猪肉')
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(1)
          .fontSize(12)
          .fontColor($r("app.color.food_item_second_color"))
        Text('点评网友推荐')
          .fontSize(10)
          .backgroundColor($r("app.color.food_item_label_color"))
          .fontColor($r("app.color.font_main_color"))
          .padding({ top: 2, bottom: 2, right: 5, left: 5 })
          .borderRadius(2)
        Text() {
          Span('月销售40')
          Span(' ')
          Span('好评度100%')
        }
        .fontSize(12)
        .fontColor($r("app.color.black"))

        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span('34.23')
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}
export default MTFoodItem