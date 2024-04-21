import { FoodItem } from '../../models'
import MTAddCut from '../MTAddCut'

@Preview
@Component
struct MTCartItem {
  @Prop fooditem: FoodItem;


  build() {
    Row() {
      Image(this.fooditem.picture)
        .width(90)
        .aspectRatio(1)
        .borderRadius(5)

      Column({
        space: 5
      }) {
        Text(this.fooditem.name)
        Row() {
          Text() {

            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span(this.fooditem.price.toString())
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
          MTAddCut({
            foodItem:this.fooditem
          })
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .height(90)
      .alignItems(HorizontalAlign.Start)
      .padding(10)

    }.width('100%')
  }
}

export default MTCartItem