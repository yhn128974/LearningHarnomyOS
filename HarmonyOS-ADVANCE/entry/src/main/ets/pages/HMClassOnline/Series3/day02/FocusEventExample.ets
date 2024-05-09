// xxx.ets
@Entry
@Component
struct FocusEventExample {
  @State oneButtonColor: Color = Color.Gray;
  @State twoButtonColor: Color = Color.Gray;
  @State threeButtonColor: Color = Color.Gray;

  build() {
    Column({ space: 20 }) {
      // 通过外接键盘的上下键可以让焦点在三个按钮间移动，按钮获焦时颜色变化，失焦时变回原背景色
      Button('First Button')
        .defaultFocus(true)
        .width(260)
        .height(70)
        .backgroundColor(this.oneButtonColor)
        .fontColor(Color.Black)
          // 监听第一个组件的获焦事件，获焦后改变颜色
        .onFocus(() => {
          this.oneButtonColor = Color.Green;
        })
          // 监听第一个组件的失焦事件，失焦后改变颜色
        .onBlur(() => {
          this.oneButtonColor = Color.Gray;
        })
        .focusable(true)

      Button('Second Button')
        .focusable(true)
        .width(260)
        .height(70)
        .backgroundColor(this.twoButtonColor)
        .fontColor(Color.Black)
          // 监听第二个组件的获焦事件，获焦后改变颜色
        .onFocus(() => {
          this.twoButtonColor = Color.Green;
        })
          // 监听第二个组件的失焦事件，失焦后改变颜色
        .onBlur(() => {
          this.twoButtonColor = Color.Grey;
        })

      Button('Third Button')
        .focusable(true)
        .width(260)
        .height(70)
        .backgroundColor(this.threeButtonColor)
        .fontColor(Color.Black)
          // 监听第三个组件的获焦事件，获焦后改变颜色
        .onFocus(() => {
          this.threeButtonColor = Color.Green;
        })
          // 监听第三个组件的失焦事件，失焦后改变颜色
        .onBlur(() => {
          this.threeButtonColor = Color.Gray ;
        })
    }.width('100%').margin({ top: 20 })
  }
}