@Entry
@Component
struct AnimateToCase {
  @State message: string = 'Hello World';
  @State colH: number = 100
  @State colW: number = 200;
  @State scaleValue: number = 1

  build() {
    Row() {
      Column() {
        Text('')
          .borderRadius(50)
          .width(this.colW)
          .height(this.colH)
          .backgroundColor(Color.Pink)
          .scale({
            x: this.scaleValue,
            y: this.scaleValue
          })
          .onClick(() => {
            // 方法一
            // animateTo(
            //   {duration:1000,iterations:-1,playMode:PlayMode.Alternate},
            //   ()=>{
            //   this.colH=50;
            //   this.colW=100
            // })

            // 方法二
            // this.colH = 50;
            // this.colW = 100

            this.scaleValue=2
          }) // 方法二
        .animation({ duration: 1000, iterations: -1, playMode: PlayMode.Alternate })
      }
      .width('100%')
    }
    .height('100%')
  }
}