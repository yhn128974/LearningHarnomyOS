import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Scroll(){
          Button('点击跳转').onClick((event: ClickEvent) => {
            router.pushUrl({ url:'pages/ClassOnline/day07/Loading'})
          })
        }


      }
      .width('100%')
    }
    .height('100%')
  }
}