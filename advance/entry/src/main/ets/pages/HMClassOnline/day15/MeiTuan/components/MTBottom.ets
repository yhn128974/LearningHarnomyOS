import { FoodItem } from '../models'
import { promptAction } from '@kit.ArkUI'
@Preview
@Component
struct MTBottom {
  @State
  count: number = 0.00
  @State peiSongFei: number = 5
  @Consume showCart: boolean
  @Consume userCard: FoodItem[]

  getcounts() {

    // let countNumber: number = 0
    // for (const element of this.userCard) {
    //   countNumber += element.price * element.count
    // }
    // return countNumber

    return this.userCard.reduce((counts: number, item: FoodItem) => {
      return counts += item.price * item.count
    }, 0)

  }

  getFoodCount() {
    let count: number = 0
    for (const element of this.userCard) {
      count += element.count
    }
    return count

  }

  build() {
    Row() {
      Row() {
        Badge({
          value: this.getFoodCount().toString(),
          position: BadgePosition.Right,
          style: { badgeSize: 18, badgeColor: '#FA2A2D' }
        }) {
          Image($r('app.media.ic_public_cart')).width(47).height(69).position({
            y: -20
          }).onClick(() => {
            this.showCart = !this.showCart
          })
        }
        .margin({
          left: 25
        })

        Column() {

          Row() {
            Text('￥').MTBootomfontColor().fontSize(12)
            Text(`${this.getcounts()}`).MTBootomfontColor().fontSize(24)
          }.alignItems(VerticalAlign.Bottom)

          Text(`预购另需配送费￥${this.peiSongFei}`).fontColor($r('app.color.search_font_color')).fontSize(12)

        }
        .alignItems(HorizontalAlign.Start)
        .margin({
          left: 25,
          right: 10
        })
        .layoutWeight(1)

        Text('去结算')
          .height(50)
          .width(100)
          .backgroundColor($r('app.color.main_color'))
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })
      }
      .width('100%')
      .height(50)
      .backgroundColor($r('app.color.bottom_back'))
      .borderRadius(25)

    }
    .width('100%')
    .padding({
      left: 20,
      right: 20,
      bottom: 20,

    })
  }
}

@Extend(Text)
function MTBootomfontColor() {
  .fontColor($r('app.color.white'))
}

export default MTBottom