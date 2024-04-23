@Entry
@Component
struct TransitionCase {
  @State message: string = 'Hello World';
  @State IsShowImage: boolean = false;

  build() {
    Row() {
      Column() {
        Row() {
          if (this.IsShowImage) {
            Image($r('app.media.1'))
              .aspectRatio(1)
              .borderRadius(100)
              .width(200)
              .height(200)
              .transition(
                TransitionEffect.asymmetric(
                  // 进入
                  TransitionEffect.OPACITY.animation({ duration: 1000 })
                    .combine(TransitionEffect.rotate({ angle: -180 }))
                    .combine(TransitionEffect.scale({ x: 0.1, y: 0.1 }))
                    .combine(TransitionEffect.move(TransitionEdge.TOP)),
                  //离开
                  TransitionEffect.OPACITY.animation({ duration: 1000 })
                    .combine(TransitionEffect.rotate({ angle: 180 }))
                    .combine(TransitionEffect.scale({ x: 0.1, y: 0.1 }))
                    .combine(TransitionEffect.move(TransitionEdge.BOTTOM))
                )

              )
          }
        }.height(200).width('100%').justifyContent(FlexAlign.Center)


        Button('show/hidden').onClick((event: ClickEvent) => {
          this.IsShowImage = !this.IsShowImage

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}