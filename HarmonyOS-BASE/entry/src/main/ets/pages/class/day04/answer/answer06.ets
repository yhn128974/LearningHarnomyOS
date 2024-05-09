@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Stack() {
        Image($r('app.media.prd_03')).width(160).borderRadius(10)
        Row() {
          Text('9999人观看')
            .fontSize(12)
            .fontColor('#fff').margin({
            left: 15,
            right: 15
          })
        }.position({
          x:55,
          y:10
        }).opacity(0.7).borderRadius(10).backgroundColor('#000').height(20)
      }.width(160)
      Text('能够使用padding、margin等属性调整内容之间的间距能够使用层叠布局(Stack)搭建界面结构')

        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#333333')
        .padding(5)
    }.width(160)

  }
}

