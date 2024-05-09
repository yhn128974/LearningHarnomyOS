@Entry
@Component
struct Index {
  @State inHide: boolean = true

  build() {
    Column() {
      if (this.inHide) {
        Row() {
          Text('登录领取现金,可微信提现').fontColor(Color.White).fontSize(14)
          Row({
            space: 10
          }) {
            Button('登录').backgroundColor('#ea5c5b').borderRadius(15).height(25)
            Image($r('app.media.ic_close')).width(14).onClick((event: ClickEvent) => {
              this.inHide = !this.inHide
            }).fillColor(Color.White)
          }
        }
        .height(34)
        .width('80%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(10)
        .backgroundColor(Color.Black)
        .opacity(0.7)
        .margin(10)
        .borderRadius(17)

      }


    }.width("100%")
  }
}

