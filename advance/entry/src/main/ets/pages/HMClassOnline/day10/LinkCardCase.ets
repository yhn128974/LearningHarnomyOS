interface FoodItem {
  food_name: string,
  food_price: number,
  food_count: number,
  food_id: number
}

@Observed
export class FoodItemModel implements FoodItem {
  food_name: string = ''
  food_price: number = 0
  food_count: number = 0
  food_id: number = 0

  constructor(model: FoodItem) {
    this.food_name = model.food_name
    this.food_price = model.food_price
    this.food_count = model.food_count
    this.food_id = model.food_id
  }
}

@Entry
@Component
struct LinkCardCase {
  @State message: string = 'Hello World';
  @State foodList: FoodItemModel[] = [
    new FoodItemModel({
      food_name: '鱼香肉丝',
      food_price: 18.8,
      food_count: 3,
      food_id: 1
    }),
    new FoodItemModel({
      food_name: '羊蝎子',
      food_price: 78.8,
      food_count: 3,
      food_id: 2
    }),
    new FoodItemModel({
      food_name: '锦州烧烤',
      food_price: 58.8,
      food_count: 1,
      food_id: 3
    }),
  ]

  build() {
    Column() {
      HmCart({
        list: this.foodList
      })
    }

  }
}

@Component
struct HmCart {
  @Link list: FoodItemModel[]

  plusItemCount(index: number) {
    this.list[index].food_count++
  }

  subtractItemCount(index: number) {
    this.list[index].food_count--
  }

  build() {
    Column() {
      List({
        space: 10
      }) {
        ForEach(this.list, (item: FoodItemModel, index) => {
          ListItem() {
            HmCartItem({
              item: item,
              plusItemCount: () => {
                this.plusItemCount(index)
              },
              subtractItemCount: () => {
                this.subtractItemCount(index)
              }
            })
          }

        })
      }


      Row() {
        Button('添加美食').onClick((event: ClickEvent) => {

        })
      }

    }
  }
}

@Component
struct HmCartItem {
  @ObjectLink item: FoodItemModel
  plusItemCount: () => void = () => {
  }
  subtractItemCount: () => void = () => {
  }

  build() {
    Row() {
      Row() {
        Text(`${this.item.food_name}`)
      }.layoutWeight(1).justifyContent(FlexAlign.Center)

      Row() {
        Text(`价格:${this.item.food_price.toString()}`)
      }.layoutWeight(1).justifyContent(FlexAlign.Center)

      Row({
        space: 10
      }) {
        Text('数量:')
        Row() {
          Button('-').onClick((event: ClickEvent) => {
            if (this.item.food_count) {
              this.subtractItemCount()
            }
          }).height(20)
          Text(`${this.item.food_count.toString()}`)
          Button('+').onClick((event: ClickEvent) => {
            this.plusItemCount()
          }).height(20)
        }

      }.layoutWeight(2).justifyContent(FlexAlign.Center)

    }.justifyContent(FlexAlign.SpaceAround).width('100%').height(60)
  }
}