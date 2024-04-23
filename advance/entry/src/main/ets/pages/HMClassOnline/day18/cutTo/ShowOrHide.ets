@Entry
@Component
struct ShowOrHide {
  @State message: string = 'Hello World';
  @State isshow: boolean = false;
  @State isshowBindContentCover: boolean = false
  @State shownumber: number = 3
  @State timer: number = -1

  @Builder
  contentCoverBuilder() {
    Column() {
      Text(this.shownumber.toString()).position({ x: '100%' }).translate({ x: "-100%" })
      Text('there is the contentCover Content').translate({ y: '100%' })
    }.backgroundColor(Color.White)

    .width('100%')
    .height('100%')
  }

  build() {
    Row() {
      Column() {
        Column() {
          if (this.isshow) {
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
          }
        }.width('100%').height(50)

        Button('显示/隐藏').onClick((event: ClickEvent) => {
          animateTo({ duration: 1000 }, () => {
            this.isshow = !this.isshow
          })
        })

        Button('Show contentCover').onClick((event: ClickEvent) => {
          this.isshowBindContentCover = true
          this.timer = setInterval(() => {
            if (this.shownumber > 0) {
              this.shownumber--
            } else {
              this.isshowBindContentCover = false
              clearTimeout(this.timer)
            }
          }, 1000)


        })

      }
      .width('100%')
    }
    .height('100%').bindContentCover(this.isshowBindContentCover, this.contentCoverBuilder)
  }
}