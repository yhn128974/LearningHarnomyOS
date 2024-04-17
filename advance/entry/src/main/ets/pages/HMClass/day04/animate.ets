@Entry
@Component
struct AnimationDemo {
  @State translateY: number = 1
  @State bgColor: ResourceColor = Color.Pink
  @State fontColor: ResourceColor = '#0094ff'
  @State fontWeight: number = 100
  @State scaleX: number = 1
  @State scaleY: number = 1
  build() {
    Column() {
      Text('C')
        .width(100)
        .height(100)
        .fontWeight(this.fontWeight)
        .backgroundColor(this.bgColor)
        .textAlign(TextAlign.Center)
        .translate({ y: this.translateY })
        .scale({
          x: this.scaleX,
          y: this.scaleY
        })
        .opacity(1)
        .animation({
          duration:1000,
          curve:Curve.EaseInOut,
          iterations:1,
          onFinish:()=>{
            console.log(' animation finished');
          }
        })
        .onAppear(()=>{
          this.bgColor = '#0094ff'
          this.translateY = 200
          this.fontColor = Color.Pink
          this.fontWeight = 900
          this.scaleX = 1.3
          this.scaleY = 1.3
        })
      Button('修改状态变量')
        .onClick(() => {
          this.bgColor =  Color.Pink
          this.translateY = 0
          this.fontColor ='#0094ff'
          this.fontWeight = 400
          this.scaleX = 1
          this.scaleY = 1

        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }
}