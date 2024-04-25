@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Stack({
      alignContent:Alignment.BottomEnd
    }) {
      // 栈结构:zIndex改变层叠结构
      Text('one').width(250).height(250).backgroundColor(Color.Green).zIndex(1)
      Text('two').width(150).height(150).backgroundColor(Color.Orange).zIndex(2)
      Text('three').width(50).width(50).backgroundColor(Color.Yellow).zIndex(3)
    }.width(300).height(600).backgroundColor(Color.Pink)
  }
}

