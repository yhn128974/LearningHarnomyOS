import { ZhiHu, ZhiHuModel } from '../models/zhuhumodel'

@Component
export struct ZhiHuList {
  @ObjectLink item: ZhiHuModel

  build() {

    Row() {
      Column() {
        Image(this.item.image).width(100).aspectRatio(1)
      }

      Column({
        space: 5
      }) {
        Row() {
          Text(this.item.title).fontSize(20).fontWeight(600).TestExtend(Color.Brown)
        }

        Row() {
          Text(this.item.text)
        }

        Row() {
          Row() {
            Text(`${this.item.address},IP ${this.item.date}`)
          }

          Row() {
            Image($r('app.media.ic_public_add_filled'))
              .width(20)
              .aspectRatio(1)
              .fillColor(this.item.isClick ? Color.Red : Color.Gray)
              .onClick(() => {
                this.item.isClick = !this.item.isClick
                if (this.item.isClick) {
                  this.item.clickNumber++
                } else {
                  this.item.clickNumber--
                }
              })
            Text(this.item.clickNumber.toString())
          }
        }
        .justifyContent(FlexAlign.SpaceBetween).width('100%')
      }.alignItems(HorizontalAlign.Start).layoutWeight(1).margin(5)

    }

  }
}

@Extend(Text)
function TestExtend(color: Color) {
  .fontColor(color)
}