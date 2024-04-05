import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('点击跳转').onClick((event: ClickEvent) => {
          router.pushUrl({ url: 'pages/ClassOnline/day05/HTTPCase' })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}