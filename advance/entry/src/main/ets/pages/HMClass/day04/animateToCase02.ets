@Entry
@Component
struct Index {
  @State isShow: boolean = false
  @State itemOpacity: number = 0
  @State translateY: string = '100%'
  @State btnColor: string = '#f5e86b'
  @State angel: number = 0

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row()
          .layoutWeight(1)
        Image($r('app.media.ic_01_6'))
          .width('100%')
          .bindContentCover(this.isShow, this.contentMenuBuilder(), { modalTransition: ModalTransition.NONE })
          .onClick(() => {
            this.isShow = true
            animateTo({ curve: Curve.Ease, duration: 600 }, () => {
              this.itemOpacity = 1
              this.btnColor = '#f3f3f3'
              this.translateY = '0%'
              this.angel = 90
            })
          })
      }
    }
  }

  @Builder
  contentMenuBuilder() {
    Column() {
      Image($r('app.media.ic_01_4'))
        .width('100%')
        .translate({ y: this.translateY })
        .opacity(this.itemOpacity)
      Text('+')
        .width(60)
        .height(60)
        .borderRadius(30)
        .backgroundColor(this.btnColor)
        .textAlign(TextAlign.Center)
        .fontSize(40)
        .rotate({ angle: this.angel })
        .onClick(() => {
          animateTo({ duration: 600, curve: Curve.Ease, onFinish: () => {
            this.isShow = false
          } }, () => {
            this.itemOpacity = 0
            this.btnColor = '#f5e86b'
            this.translateY = '100%'
            this.angel = 0
          })
        })

    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.End)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding({ bottom: 40 })
  }
}