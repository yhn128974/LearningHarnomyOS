@Entry
@Component
struct SharedElementCase02 {
  @State message: string = 'SharedElementCase02';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold).sharedTransition('text001',{
        duration:1000
      })
      Image($r('app.media.1'))
        .width(50)
        .position({
          x: 20,
          y: 20
        })
        .sharedTransition('shared001', {
          duration: 2*1000
        })

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}