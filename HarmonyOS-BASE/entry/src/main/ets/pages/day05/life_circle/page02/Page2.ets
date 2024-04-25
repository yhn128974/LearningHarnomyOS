import { router } from '@kit.ArkUI';

@Entry
@Component
struct Page2 {
  @State message: string = 'HI this the second page';

  build() {
    Row() {
      Column({
        space:10
      }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('click to back to main page').onClick((event: ClickEvent) => {
          router.back({
            url:'pages/day05/life_circle/page01/Page01'
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear(): void {
    console.log('page2 aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('page2 aboutToDisapp')
  }

  onPageShow(): void {
    console.log('page2 onPageShow')
  }
  onPageHide(): void {
    console.log('page2 onPageHide ')
  }

}