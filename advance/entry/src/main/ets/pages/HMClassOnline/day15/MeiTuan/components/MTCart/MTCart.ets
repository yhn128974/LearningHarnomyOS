import { FoodItem } from '../../models'
import MTCartItem from './MTCartItem'

@Preview
@Component
export default struct MTCart {


  build() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Column() {
        Row() {
          Text('购物车')
          Text('清空购物车').fontColor($r('app.color.search_font_color')).fontSize(12)
        }
        .width('100%')
        .padding({
          left: 15,
          right: 15
        })
        .justifyContent(FlexAlign.SpaceBetween)
        .height(50)

        Column({
          space: 20
        }) {
          ForEach([1, 2, 3, 4], () => {
            MTCartItem()
          })
        }.padding({
          left: 15,
          right: 15
        })

      }
      .backgroundColor(Color.White)
      .padding({ bottom: 100 })
      .borderRadius({
        topLeft: 16,
        topRight: 16
      }).opacity(1)
    }
    .backgroundColor("rgba(0,0,0,0.7)")
    .height('100%')
    .width('100%')

  }
}