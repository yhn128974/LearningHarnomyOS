import { FoodItem } from '../../models'
import MTAddCut from '../MTAddCut'
@Preview
@Component
struct MTFoodItem {
  @Prop Item: FoodItem


  build() {
    Row() {
      Image(this.Item.picture)
        .width(90)
        .aspectRatio(1)

      Column({ space: 5 }) {
        Text(this.Item.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        Text(this.Item.description)
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
          Span(`月销售${this.Item.month_saled}`)
          Span(' ')
          Span(this.Item.like_ratio_desc)
        }
        .fontSize(12)
        .fontColor($r("app.color.black"))

        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span(this.Item.price.toString())
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
          MTAddCut({
            foodItem:this.Item
          })
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