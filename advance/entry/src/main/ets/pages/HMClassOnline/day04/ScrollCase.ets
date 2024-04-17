@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State middleHeights: number = 0
  scroller: Scroller = new Scroller()

  @Styles
  middleSDnamicStyle(){
    .stateStyles({
      normal: this.middleNormalStyle,
      pressed: this.middlePressedStyle
    })
  }

  @Styles
  middleNormalStyle(){
    .border({
      width: 1,
      style: BorderStyle.Solid
    })
  }

  @Styles
  middlePressedStyle(){
    .border({
      width: 1,
      style: BorderStyle.Solid,
      color: Color.Yellow
    })
  }

  build() {
    Column() {
      Row().width('100%').height(50).backgroundColor(Color.Red)
        .onClick(() => {
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 0
          })
        })
      Scroll(this.scroller) {
        //   Scroll List Grid Swiper WaterFlow
        Column({
          space: 10
        }) {
          ForEach(Array.from({ length: 10 }), () => {
            ScrollItem()
          })
        }
      }
      .width('100%')
      .backgroundColor(Color.Orange)
      .height(this.middleHeights)
      .middleSDnamicStyle()
      .scrollBarColor(Color.Yellow)
      Row().width('100%').height(50).backgroundColor(Color.Blue)
        .onClick(() => {
          this.scroller
            //   .scrollTo({
            //   xOffset: 0,
            //   yOffset: 100
            // })
            .scrollEdge(Edge.Bottom)
        })
    }
    .width('100%').height('100%')
    .onAreaChange((oldValue: Area, newValue: Area) => {
      this.middleHeights = (newValue.height as number) - 100
    })
  }
}

@Component
struct ScrollItem {
  build() {
    Row() {
      Text('滚动区域内容')
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
    .margin({
      top: 20,
    })
    .justifyContent(FlexAlign.Center)
  }
}
