import { FoodItem } from '../models'

@Component
struct MTBottom {
  @State
  count: number = 0.00
  @State peiSongFei: number = 0

  @Consume showCart: boolean


  build() {
    Row() {
      Row() {
        Badge({
          value: '0',
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
            Text(`0.00`).MTBootomfontColor().fontSize(24)
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