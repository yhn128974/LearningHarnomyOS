import { router } from '@kit.ArkUI';

@Entry
@Component
struct SharedElementCase01 {
  @State message: string = 'SharedElementCase01';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold).sharedTransition('text001')

      Image($r('app.media.1'))
        .width(200)
        .sharedTransition('shared001')
      Button('登录')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/HMClassOnline/Series3/day13/animation/SharedElementCase02'
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}