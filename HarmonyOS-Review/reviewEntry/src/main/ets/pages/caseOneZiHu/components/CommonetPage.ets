import { ReplyItem, ReplyItemModel } from "../data"

@Preview
@ComponentV2
struct HmCommentItem {
  @Param item: ReplyItemModel = new ReplyItemModel({} as ReplyItem)
  @Event handleItemChange: () => void = () => {
  }

  build() {
    Row({ space: 10 }) {
      Image(this.item.avatar)
        .width(40)
        .height(40)
        .borderRadius(20)

      Column({ space: 10 }) {

        Text(this.item.author)
          .fontColor("#303a43")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Text(this.item.content)
          .fontColor("#2f3642")
          .lineHeight(22)
        Row() {
          Text(`${this.item.time},${this.item.area}`)
            .fontColor("#cacaca")
            .fontSize(12)

          Row({ space: 4 }) {
            Image($r("sys.media.AI_play"))
              .width(20)
              .height(20)
              .fillColor(this.item.likeFlag ? "red" : "#cacaca")
              .onClick(() => {


                this.handleItemChange()

              })

            Text(this.item.likeNum.toString())
              .fontColor("#cacaca")
              .fontSize(20)


          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

    }
    .alignItems(VerticalAlign.Top)
    .padding(20)
    .width('100%')
  }
}

export { HmCommentItem }