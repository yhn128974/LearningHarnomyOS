@Entry
@Component
struct TrailingClosure {
  @State message: string = 'Hello World';

  @Builder
  BuilderToggle() {
    Toggle({
      type: ToggleType.Switch,
      isOn: true
    })
  }

  build() {
    Column() {
      HMPanel({
        title: 'hello world!',
        //一般BuilderParam传参方式
        leftBuilder: () => {
          this.BuilderToggle()
        }

      })

      HMPanel({
        title: 'hello Java!',
        // leftBuilder: () => {
        //   this.BuilderToggle()
        // }
      }) {
        //尾随闭包转递方法,不过由于没有显示调用子组件的方法所以得不到子组件内部的参数
        this.BuilderToggle()
      }

      HMPanel({
        title: 'hello typeScript!',
        // leftBuilder: () => {
        //   this.BuilderToggle()
        // }
      }) {
        //尾随闭包
        // Text('侧式')
        //写了{}默认传递空的builder结构
      }
    }.width('100%').height('50%')
  }
}

@ComponentV2
struct HMPanel {
  @Param title: string = 'defaultTitle'
  @BuilderParam leftBuilder: () => void = this.defaultLeft

  @Builder
  defaultLeft() {
    Text('left')
  }

  build() {
    Row() {
      Text(this.title)
      this.leftBuilder()
    }
    .width('100%')
    .height(50)
    .background('#ccc')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
  }
}