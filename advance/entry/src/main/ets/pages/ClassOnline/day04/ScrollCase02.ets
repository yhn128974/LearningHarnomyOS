@Entry
@Component
struct ScrollCase02 {
  @State message: string = 'Hello World';
  scroller:Scroller = new Scroller()

  build() {
    Row() {
      Column() {
        Scroll(this.scroller) {
          Row({
            space:10
          }){
            ForEach(Array.from({ length: 10 }), () => {
              ScrollCase()
            })
          }

        }.scrollable(ScrollDirection.Horizontal)

        Row() {
          Button('<==').onClick((event: ClickEvent) => {
            this.scroller.scrollEdge(Edge.Start)
          })
          Button('==>').onClick((event: ClickEvent) => {
            this.scroller.scrollEdge(Edge.End)
          })
        }.justifyContent(FlexAlign.SpaceBetween).width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ScrollCase {
  build() {
    Column() {
      Text('最新电影...')
    }.height(100).backgroundColor(Color.Pink).width(50)
  }
}