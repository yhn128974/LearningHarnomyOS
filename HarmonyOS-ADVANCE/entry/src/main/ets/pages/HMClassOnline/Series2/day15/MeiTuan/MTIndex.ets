import MTBottom from './components/MTBottom'
import MTMain from './components/MTMain/MTMain'
import MTTop from './components/MTTop'
import MTCart from './components/MTCart/MTCart'
import { Category, FoodItem } from './models'
import { CategoryInfoList } from './api'
import { CartStore } from './utils'
import { promptAction, window } from '@kit.ArkUI'


@Entry
@Component
struct MTIndex {
  @Provide showCart: boolean = false
  @State CategoryList: Category[] = []
  @Provide userCard: FoodItem[] = []
  @State voidtopheight: number = 0

  async aboutToAppear(): Promise<void> {

    this.getCategoryList()

    this.userCard = CartStore.getCarts()

    // 沉浸式方法一
    // 获取页面window对象
    const win = await window.getLastWindow(getContext())

    // 局部关闭全屏
    // win.setWindowLayoutFullScreen(false)

    // this.voidtopheight=px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height)
    // topRect:到达顶部的高度
    // AppStorage.setOrCreate('VoidTopHeight', px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height))
    // this.voidtopheight = AppStorage.get('VoidTopHeight') as number

    // 沉浸式方法二
    // win.setWindowBackgroundColor('#ffc0cb')


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
            CategoryList: this.CategoryList,
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
    .backgroundColor(Color.White)
    .backgroundColor(Color.Pink)
  }
}