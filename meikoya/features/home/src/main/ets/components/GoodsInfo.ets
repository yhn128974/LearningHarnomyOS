import { Goods } from "../viewmodels"
import { promptAction } from "@kit.ArkUI"


@ComponentV2
export struct GoodsInfo {
  @Param
  goods: Goods = {} as Goods

  build() {
    Column() {
      // 有 多张图片显示轮播图
      if (this.goods.mainPictures && this.goods.mainPictures.length) {
        Swiper() {
          ForEach(this.goods.mainPictures, (src: string, index: number) => {
            Image(src)
              .onClick(() => {

              })
          })
        }
        .cachedCount(5)
        .indicator(Indicator.digit()
          .right(10)
          .bottom(6))
        .width('100%')
        .aspectRatio(1)
      } else {
        Image(this.goods.picture)
      }

      Column() {
        Text() {
          Span('¥ ')
          Span(this.goods.price)
            .fontSize(24)
        }
        .width('100%')
        .fontWeight(500)
        .fontColor($r('[basic].color.black'))
        .margin({ bottom: 8, top: 8 })

        Text(this.goods.name)
          .width('100%')
          .fontColor($r('[basic].color.text'))
          .margin({ bottom: 8 })
        Text(this.goods.desc)
          .fontSize(13)
          .width('100%')
          .fontColor($r('[basic].color.gray'))
          .margin({ bottom: 8 })

        Column() {
          Row({ space: 8 }) {
            Text('商品规格')
              .fontSize(13)
              .fontWeight(500)
              .fontColor($r('[basic].color.black'))
            Text('请选择')
              .fontSize(13)
              .fontColor($r('[basic].color.gray'))
            Blank()
            Image($r('[basic].media.ic_public_right'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('[basic].color.gray'))
          }
          .width('100%')
          .height(40)
          .onClick(() => {
          })

          Row() {
            Text('无忧退货 · 快速退款 · 免费包邮')
              .fontColor($r('[basic].color.text'))
              .fontSize(13)
            Blank()
            Image($r('[basic].media.ic_public_right'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('[basic].color.gray'))
          }
          .width('100%')
          .height(40)
          .border({
            width: { top: 0.5 },
            color: $r('[basic].color.under')
          })
        }
      }
      .backgroundColor($r('[basic].color.white'))
      .borderRadius(8)
      .margin(8)
      .padding(8)
    }
  }
}
