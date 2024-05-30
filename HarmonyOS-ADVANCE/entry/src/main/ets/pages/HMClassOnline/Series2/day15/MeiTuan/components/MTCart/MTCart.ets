import { FoodItem } from '../../models'
import { CartStore } from '../../utils'
import MTCartItem from './MTCartItem'

@Preview
@Component
export default struct MTCart {
  @Consume
  userCard: FoodItem[]

  build() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Column() {
        Row() {
          Text('购物车')
          Text('清空购物车').fontColor($r('app.color.search_font_color')).fontSize(12).onClick(() => {
            this.userCard = []
          })
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
        })
        {
          List() {
            ForEach(this.userCard || [], (item: FoodItem) => {
              ListItem() {
                MTCartItem({
                  fooditem: item
                })
              }
            }, (item: FoodItem) => {
              //  通过id判断是否更新数据
              return item.id.toString()
            })
          }.padding({
            left: 15,
            right: 15
          })
        }

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