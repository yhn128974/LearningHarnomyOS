import { Goods } from '../viewmodels'

@ComponentV2
export struct GoodsDetail {
  @Param goods: Goods = {} as Goods

  build() {
    Column() {
      Row() {
        Text('商品详情')
          .fontSize(13)
          .fontWeight(700)
          .fontColor($r('[basic].color.black'))
          .margin({ left: 16 })
      }
      .width('100%')
      .height(50)

      ForEach(this.goods.details?.pictures, (src: string) => {
        Image(src)
          .width('100%')
      })
    }
    .backgroundColor($r('[basic].color.white'))
    .margin({ bottom: 8 })
  }
}