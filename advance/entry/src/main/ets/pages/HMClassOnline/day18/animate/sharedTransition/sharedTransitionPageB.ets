import { router } from '@kit.ArkUI';

@Entry
@Component
struct TransitionCase {
  @State message: string = 'Hello World';
  @State IsShowImage: boolean = false;
  @State ImageUrl: ResourceStr = ''

  aboutToAppear(): void {
    this.ImageUrl = router.getParams() as ResourceStr
  }

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.1'))
            .aspectRatio(1)
            .sharedTransition('my_image')
            .width('100%')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .onClick(()=>{
          router.back()
        })

      }
      .width('100%')
    }

  }
}