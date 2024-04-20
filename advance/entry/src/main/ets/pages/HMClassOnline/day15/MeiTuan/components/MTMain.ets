import MTFoodItem from './MTFoodItem'

@Component
struct MTMain {
  @State titlelist: string[] = [
    '一人套餐', '特色烧烤', '杂粮主食'
  ]
  @State currentIndex: number = 0

  build() {
    Row() {
      Column({
        space: 10
      }) {
        ForEach(this.titlelist, (item: string, index: number) => {
          Text(item)
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
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], () => {
            MTFoodItem()
          })
        }

      }.layoutWeight(1).margin({
        bottom: 120
      })

    }.width('100%')

  }
}

export default MTMain