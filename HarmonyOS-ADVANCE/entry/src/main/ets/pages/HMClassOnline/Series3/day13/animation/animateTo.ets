@Entry
@Component
struct AnimateToCase {
  @State message: string = 'Hello World';
  @State textSize: number = 50
  @State textColor: string = '#000'
  @State textOpacity: number = 1
  @State trx: number = 0;
  @State try: number = 0;

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(this.textSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.textColor)
          .opacity(this.textOpacity)
          .translate({
            x: this.trx,
            y: this.try
          })
        Button('隐藏')
          .onClick(() => {
            // 参数配置动画效果,回调操作当前数据状态
            animateTo({
              duration: 1000,


            }, () => {
              this.message = 'World Hello'
              this.textSize = 16
              this.textColor = '#ff4400'
              this.textOpacity = 0
              this.trx=365
              this.try=800
            })
          })
        Button('显示')
          .onClick(() => {
            animateTo({ duration: 2000 }, () => {
              this.message = 'Hello World'
              this.textSize = 50
              this.textColor = '#ff00f0'
              this.textOpacity = 1
              this.trx=0
              this.try=0
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}