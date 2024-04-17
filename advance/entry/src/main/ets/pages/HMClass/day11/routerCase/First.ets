import { router } from '@kit.ArkUI';

@Entry
@Component
struct First {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('点击跳转SecondPage').onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/HMClass/day11/routerCase/Second'
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}