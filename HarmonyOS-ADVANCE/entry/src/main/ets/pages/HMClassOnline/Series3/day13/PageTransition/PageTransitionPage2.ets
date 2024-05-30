import { router } from '@kit.ArkUI';

@Entry
@Component
struct PageTransitionPage2 {
  @State message: string = 'PageTransitionPage2';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('push进入1')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/HMClassOnline/Series3/day13/PageTransition/PageTransitionPage1'
            })
          })
        Button('pop进入1')
          .onClick(()=>{
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}