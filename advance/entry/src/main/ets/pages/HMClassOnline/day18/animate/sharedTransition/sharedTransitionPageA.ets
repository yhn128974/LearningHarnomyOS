import { router } from '@kit.ArkUI';

@Entry
@Component
struct TransitionCase {
  @State message: string = 'Hello World';
  @State IsShowImage: boolean = false;
  @State ImageUrl: ResourceStr = 'app.media.1'

  build() {
    Row() {
      Column() {
        Row() {

          Image($r(this.ImageUrl.toString()))
            .aspectRatio(1)
            .borderRadius(100)
            .width(200)
            .height(200)
            .sharedTransition('my_image', {
              duration: 500
            })

        }
        .height(200)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .onClick((event: ClickEvent) => {

          router.pushUrl({
            url: 'pages/HMClassOnline/day18/animate/sharedTransition/sharedTransitionPageB',
            params: {
              ImageUrl: this.ImageUrl
            }
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}