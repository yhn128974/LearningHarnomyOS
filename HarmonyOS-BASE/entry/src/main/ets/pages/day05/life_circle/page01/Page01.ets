import { TitleComponent } from './components/title_comp'
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Page01 {
  @State ishowtitle: boolean = true;

  build() {

    Column({space:10}) {
      Row() {
        if (this.ishowtitle) {
          TitleComponent()
        } else {
          Text('test title was been removed')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }

      }.width('100%')


      Row({
        space: 10
      }) {
        Button('click to remove title').onClick((event: ClickEvent) => {
          this.ishowtitle = !this.ishowtitle
        })

        Button('click to next page').onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/day05/life_circle/page02/Page2'
          })
        })



      }

    }.width('100%').height('100%')

  }


  aboutToAppear(): void {
    console.log('page1 aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('page1 aboutToDisapp')
  }

  onPageShow(): void {
    console.log('page1 onPageShow')
  }
  onPageHide(): void {
    console.log('page1 onPageHide ')
  }
  onBackPress(): boolean | void {
    console.log('page1 onBackPress')
  }


}