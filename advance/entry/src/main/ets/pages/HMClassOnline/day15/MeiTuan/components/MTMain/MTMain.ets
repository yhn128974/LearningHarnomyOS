import MTFoodItem from './MTFoodItem'
import { Category, FoodItem } from '../../models'
@Component
struct MTMain {

  @State currentIndex: number = 0

  @Prop CategoryList: Category[]

  @Provide selectedItem: FoodItem[] = []



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
              this.currentIndex = index
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
        List() {
            ForEach(this.CategoryList[this.currentIndex]?.foods||[], (item:FoodItem,index:number) => {
              MTFoodItem({
                Item:item,
              })
            })
        }
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