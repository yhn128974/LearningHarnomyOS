import { FoodItem } from '../../models'
import MTAddCut from '../MTAddCut'
@Preview
@Component
struct MTCartItem {


  build() {
    Row() {
      Image('https://zqran.gitee.io/images/waimai/8078956697.jpg')
        .width(90)
        .aspectRatio(1)
        .borderRadius(5)

      Column({
        space:5
      }) {
        Text('小份酸菜汤杂酱面+肉夹馍套餐')
        Row() {
          Text() {

            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span('34.23')
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)

          }
          MTAddCut()
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