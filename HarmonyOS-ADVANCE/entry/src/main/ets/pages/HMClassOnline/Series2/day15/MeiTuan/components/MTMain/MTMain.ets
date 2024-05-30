import MTFoodItem from './MTFoodItem'
import { Category, FoodItem } from '../../models'

@Component
struct MTMain {
  @State currentIndex: number = 0
  @Prop CategoryList: Category[]
  scroller: Scroller = new ListScroller()

  @Builder
  itemHead(title: string) {
    Row() {
      Text(title).width('100%').height(50)
    }.padding(10).backgroundColor($r('app.color.font_main_color'))
  }

  build() {
    Row() {
      Column({
        space: 10
      }) {
        ForEach(this.CategoryList, (item: Category, index: number) => {
          Text(item.name)
            .height(50)
            .width('100%')
            .fontSize(14)
            .onClick(() => {
              this.currentIndex=index
              this.scroller.scrollToIndex(this.currentIndex)

            })
            .textAlign(TextAlign.Center)
            .backgroundColor(this.currentIndex == index ? $r('app.color.white') : $r('app.color.left_back_color'))
        })
      }
      .justifyContent(FlexAlign.Start)
      .height('100%')
      .width(90)
      .backgroundColor($r('app.color.left_back_color'))


      Column() {
        List({ scroller: this.scroller }) {
          ForEach(this.CategoryList, (item: Category, index: number) => {
            ListItemGroup({
              header: this.itemHead(item.name),
            }) {
              ListItem() {
                Column() {
                  ForEach(this.CategoryList[index]?.foods || [], (item: FoodItem, index: number) => {
                    MTFoodItem({
                      Item: item,
                    })
                  })
                }

              }
            }
          })
        }.sticky(StickyStyle.Header).onScrollIndex((value) => {
          this.currentIndex = value
        })
      }
      .layoutWeight(1)
      .padding({
        bottom: 120
      })
      .height('100%')

    }.width('100%').height('100%')

  }
}

export default MTMain