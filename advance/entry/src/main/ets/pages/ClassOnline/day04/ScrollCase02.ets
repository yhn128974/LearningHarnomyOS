@Entry
@Component
struct ScrollCase02 {
  @State message: string = 'Hello World';
  scroller: Scroller = new Scroller()

  @State num1:number = 1;

  build() {
    Row() {
      Column() {
        Scroll(this.scroller) {
          Row({
            space: 10
          }) {
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

        // DatePicker()
        // TimePicker()
      }
      .width('100%')
    }
    .height('100%')
  }

  @Styles conmentstyle(){
    .width(this.num1)
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