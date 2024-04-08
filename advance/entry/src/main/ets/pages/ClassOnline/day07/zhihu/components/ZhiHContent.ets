import { zhifuModel } from '../moduls/ZhiHu'


@Preview
@Component
export struct ZhiHuContent {
  @Prop commentItem: zhifuModel

  build() {
    Row() {
      Image($r(this.commentItem.ImageUrl)).width(40).height(40).borderRadius(15).margin({
        top: 10
      })
      Column({
        space: 10
      }) {
        Row() {
          Text(this.commentItem.name).fontWeight(600)
        }.width('100%')
        Row() {
          Text(this.commentItem.text)
        }.width('100%')
        Row() {
          Row() {
            Text(new Date().getDate().toString()).fontSize(12).fontColor('#DDD')
            Text('IP属地' + this.commentItem.address).fontSize(12).fontColor('#DDD')
          }

          Row() {
            Image($r('app.media.24gf_heart')).width(12)
            Text(this.commentItem.dainzhanshu.toString()).fontSize(12).fontColor('#DDD')
          }
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
      }.layoutWeight(1).padding(10).justifyContent(FlexAlign.Start)
    }
    .justifyContent(FlexAlign.Start)
    .border({
      width: {
        bottom: 1
      },
      style: BorderStyle.Solid,
      color: '#ddd'
    })
    .margin(10)
    .alignItems(VerticalAlign.Top)

  }
}