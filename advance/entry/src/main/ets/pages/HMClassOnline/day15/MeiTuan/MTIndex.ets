import MTBottom from './components/MTBottom'
import MTMain from './components/MTMain/MTMain'
import MTTop from './components/MTTop'
import MTCart from './components/MTCart/MTCart'
import { Category, FoodItem } from './models'
import { CategoryInfoList } from './api'


@Entry
@Component
struct MTIndex {
  @Provide showCart: boolean=false


  @State CategoryList: Category[] = []


  aboutToAppear(): void {
    this.getCategoryList()
  }

  async getCategoryList() {
    this.CategoryList = await CategoryInfoList()

  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          MTTop()
          MTMain({
            CategoryList:this.CategoryList,

          })
        }
        .height("100%").width('100%')

        if (this.showCart) {

          MTCart()
        }
        MTBottom()

      }.layoutWeight(1)

    }
    .width('100%')
    .height("100%")
    .backgroundColor($r("app.color.white"))
  }
}