import { router } from '@kit.ArkUI';

@Entry
@Component
struct LifeCirclePageA {
  @State message: string = 'Page A';

  onPageShow(): void {
  }

  onPageHide(): void {
  }

  onBackPress(): boolean | void {
  }

  aboutToAppear(): void {
  }

  aboutToDisappear(): void {
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('to Page B').onClick((event: ClickEvent) => {
          router.pushUrl({
            url:'pages/HMClassOnline/day17/LifeCircle/LifeCirclePageB'
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}