@Entry
@Component
struct ScrollDemo {
  scroller: Scroller = new Scroller()

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll(this.scroller) {
        Column({
          space: 10
        }) {
          Image($r('app.media.icon'))
          Image($r('app.media.icon'))
          Image($r('app.media.icon'))
        }
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .width('100%')
      .height(400)
      .scrollBarColor(Color.Orange)
      .scrollBarWidth(20)
      .scrollBar(BarState.Auto) // 关闭滚动条
      .edgeEffect(EdgeEffect.Spring) // 边缘效果
      .onScroll((x: number, y: number) => {
        console.log('Scrolling...')
        // console.log("" + x, y)
      })
      .onScrollEdge((side: Edge) => {
        console.log("" + side)
      })


      Column() {
        Button('返回顶部')
          .onClick(() => {
            // 滚到顶部
            this.scroller.scrollEdge(Edge.Top)
          })
        Button('滚动制定距离')
          .onClick(() => {
            this.scroller.scrollTo({ xOffset: 0, yOffset: 0 })
          })
        Button('返回当前的滚动偏移量').onClick((event: ClickEvent) => {

          console.log("x" + this.scroller.currentOffset().xOffset,"y" + this.scroller.currentOffset().yOffset)
        })
      }
    }

  }
}