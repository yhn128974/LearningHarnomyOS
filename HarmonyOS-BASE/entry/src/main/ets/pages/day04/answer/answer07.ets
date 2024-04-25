@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {

        Stack({
          alignContent: Alignment.Bottom
        }) {
          Image($r("app.media.banner1")).width('100%').borderRadius(10)
          Column() {
            Text('Apple 如何构建 iCold 来存储数十亿...能够使用margin、padding、space等调整内容位置')
              .fontWeight(800)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .fontColor(Color.White)
              .margin({ left: 20, right: 10 })
              .fontSize(16)
              .lineHeight(16)

              .width('100%')
            Row({
              space: 5
            }) {
              Text('').width(22).height(3).backgroundColor(Color.White).opacity(0.6)
              Text('').width(22).height(3).backgroundColor(Color.White).opacity(0.6)
              Text('').width(22).height(3).backgroundColor(Color.White)
              Text('').width(22).height(3).backgroundColor(Color.White).opacity(0.6)
            }
            .margin({ left: 20, bottom: 15, top: 15, right: 10 })
            .width('100%')
          }.width('100%')

        }
       .margin(10)

    }.height('100%').width('100%')

  }
}

