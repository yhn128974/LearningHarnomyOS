@Entry
@Component
struct AnimationDemo {
  @State translateValue: number = -200


  build() {
    Column({ space: 50 }) {
      Stack() {
        Text('点击签到')
          .fullSize()
          .fontColor(Color.White)
          .fontSize(28)
          .textAlign(TextAlign.Center)
          .fontWeight(900)
          .borderRadius(25)
          .linearGradient({
            angle: 90,
            colors: [
              ['#ed7d59', 0], ['#eb5ea5', 1]
            ]
          })
        // 扫光
        Text()
          .linearGradient({
            angle: 135,
            colors: [['rgba(255,255,255,0)', 0], ['rgba(255,255,255,0.8)', 0.5], ['rgba(255,255,255,0)', 1]]
          })
          .height('200%')
          .width(20)
          .rotate({ angle: 45 })
          .translate({
            x: this.translateValue,
          })
          .animation({
            duration: 1000,
            iterations: -1,
            delay: 2000
          })
          .onAppear(() => {
            this.translateValue = 200
          })
      }
      .clip(true)
      .width(200)
      .height(50)
    }
    .width('100%')
    .height('100%')
    .padding(20)

  }

  @Styles
  fullSize() {
    .width('100%')
    .height('100%')
  }
}