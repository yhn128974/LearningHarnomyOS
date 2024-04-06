@Entry
@Component
struct AnimationDemo {
  // 第一步: 声明相关状态变量
  @State animate: boolean = false;
  @State translateY: number = 1
  @State bgColor: ResourceColor = Color.Pink
  @State fontColor: ResourceColor = '#0094ff'
  @State fontWeight: number = 100
  @State angle: number = 0

  // 第四步：通过状态变量改变UI界面，系统会检测改变后的UI界面与之前的UI界面的差异，对有差异的部分添加动画
  // 注意：用尺寸做动画触发测量布局，性能开销大，如果要改变组件尺寸建议使用scale
  build() {
    Column() {
      Text('itheima')
        .width(100)
        .height(100)// 第二步：将状态变量设置到相关可动画属性接口（width、height、backgroundColor、opacity、scale、rotate、translate）
          // 第三步：通过属性动画接口开启属性动画，控件的函数调用顺序是从下往上的，这个animation会作用到上面的属性
        .fontColor(this.fontColor)
        .fontWeight(this.fontWeight)
        .backgroundColor(this.bgColor)
        .textAlign(TextAlign.Center)
        .translate({ y: this.translateY })
        .rotate({ angle: this.angle })
        .opacity(1)


      Button('切换动画')
        .onClick(() => {
          this.animate=!this.animate
          animateTo({
            duration: 500,
            curve: Curve.Ease, // 动画曲线
            // delay: 2000,
            // iterations: -1,
            playMode: PlayMode.Alternate,
            onFinish: () => {
              console.log('onFinish 执行啦')
            }
          },()=>{
            this.bgColor = !this.animate?Color.Pink:'#0094ff'
            this.translateY = !this.animate?1:100
            this.fontColor =!this.animate?'#0094ff':Color.Pink
            this.fontWeight =!this.animate?100: 900
            this.angle = !this.animate ? 0:135
          })

        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }
}