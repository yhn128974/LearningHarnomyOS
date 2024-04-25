import { FoodItem } from '../../models'

@Preview
@Component
struct MTAddCut {
  @Prop foodItem: FoodItem
  @Consume
  userCard: FoodItem[]

  postInfotouserCard() {
    if (this.userCard.find(item => item.id == this.foodItem.id)) {
      let index = this.userCard.findIndex(item => item.id == this.foodItem.id)
      this.userCard.splice(index, 1, this.foodItem)
      if (this.userCard[index].count == 0) {
        this.userCard.splice(index, 1)
      }
    } else {
      this.foodItem.count--
      this.userCard.unshift(this.foodItem)
    }
  }

  getItemcount() {
    let count: number = 0
    if (this.userCard.find(item => item.id == this.foodItem.id)) {
      let index = this.userCard.findIndex(item => item.id == this.foodItem.id)
      count = this.userCard[index].count
      return count
    } else {
      return count
    }
  }

  build() {
    Row({ space: 8 }) {
      Row() {
        Image($r('app.media.ic_screenshot_line'))
          .width(10)
          .aspectRatio(1)
      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.white"))
      .borderRadius(4)
      .border({ width: 0.5, color: $r("app.color.main_color") })
      .onClick(() => {
        if (this.foodItem.count) {
          this.foodItem.count--
          this.postInfotouserCard()
        }
      })
      .visibility(this.getItemcount() ? Visibility.Visible : Visibility.Hidden)

      Text((this.getItemcount()).toString())
        .fontSize(14)
        .visibility(this.getItemcount() ? Visibility.Visible : Visibility.Hidden)

      Row() {
        Image($r('app.media.ic_public_add_filled'))
          .width(10)
          .aspectRatio(1)
      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.main_color"))
      .borderRadius(4)
      .onClick(() => {
        this.foodItem.count++
        this.postInfotouserCard()
      })

    }
  }
}

export default MTAddCut