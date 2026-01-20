@Entry
@Component
struct ScrollPage {
  @State message: string = 'Hello World';
  //创建一个控制器
  currentScroller: Scroller = new Scroller()

  build() {
    Column() {
      Row() {

      }.width('100%').height(50).backgroundColor(Color.Orange)

      Scroll() {
        Column({
          space: 10
        }) {
          Text().width('100%').backgroundColor(Color.White).height(50)
          Text().width('100%').backgroundColor(Color.White).height(50)
          Text().width('100%').backgroundColor(Color.White).height(50)
          Text().width('100%').backgroundColor(Color.White).height(50)
        }
        .width('100%')
        .height(1000)
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor('#ccc')
      }
      .width('100%')
      .height(300)
      .edgeEffect(EdgeEffect.Spring) //配置滑动特效
      //横向滚动
      Scroll(this.currentScroller) {
        Row() {
          MovieCom()
          MovieCom()
          MovieCom()
          MovieCom()
          MovieCom()
        }.width(1000).justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
      .backgroundColor(Color.Orange)
      .layoutWeight(1)
      .scrollable(ScrollDirection.Horizontal)
      .edgeEffect(EdgeEffect.Spring)

      Row() {
        Button('滑倒左侧').onClick((event: ClickEvent) => {
          this.currentScroller.scrollEdge(Edge.Start)
        }).type(ButtonType.Normal)

        Button('滑倒到指定位置').onClick((event: ClickEvent) => {
          this.currentScroller.scrollTo({
            xOffset: 200,
            yOffset: 0,
            animation: { duration: 1000, canOverScroll: true },
          })
        }).type(ButtonType.Normal)
        Button('滑倒右侧')
          .onClick((event: ClickEvent) => {
            this.currentScroller.scrollEdge(Edge.End)
          }).type(ButtonType.Normal)
      }.justifyContent(FlexAlign.SpaceAround).width('100%')

      Row() {

      }.width('100%').height(50).backgroundColor(Color.Pink)
    }
  }
}

@Component
struct MovieCom {
  build() {
    Column() {
      Text('hello')
    }
    .height('100%')
    .width(150)
    .padding(10)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
  }
}