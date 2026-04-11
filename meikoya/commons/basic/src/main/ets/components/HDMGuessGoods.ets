import { HDMGoods } from "."
import { getGuessDataAPI } from "../api/guess"
import { AppBreakPoint, AppSafeArea, BreakPointType, GuessParams, HDMGoodsItem } from "../viewmodels"
import { AppStorageV2 } from "@kit.ArkUI"

@ComponentV2
export struct HDMGuessGoods {
  breakObj: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  appSafe: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Param
  title: string = "猜你喜欢"
  @Local
  list: HDMGoodsItem[] = []
  @Local
  loading: boolean = false
  @Local
  finished: boolean = false
  params: GuessParams = {
    page: 1,
    pageSize: 8
  }

  aboutToAppear(): void {
    this.getGuessList()
  }

  async getGuessList() {
    const res = await getGuessDataAPI(this.params) // 10
    this.list.push(...res.items)
    if (this.params.page >= res.pages) {
      this.finished = true
    } else {
      this.params.page++
    }

  }

  @Builder
  getFootBuilder() {
    Row({ space: 10 }) {
      if (this.loading) {
        Text("加载中...")
          .fontSize(12)
          .fontColor($r("app.color.gray"))
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
      } else {
        if (this.finished) {
          Text("没有啦")
            .fontSize(12)
            .fontColor($r("app.color.gray"))
        }
      }

    }
    .width("100%")
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontColor($r("app.color.black"))
      }
      .width("100%")
      .height(50 + this.appSafe.topHeight)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.white"))
      .margin({
        bottom: 10,
      })
      .padding({
        top: this.appSafe.topHeight
      })

      WaterFlow({ footer: this.getFootBuilder }) {
        Repeat<HDMGoodsItem>(this.list)
          .each((obj: RepeatItem<HDMGoodsItem>) => {
            FlowItem() {
              HDMGoods({ goods: obj.item })
            }
          })
          .virtualScroll()
          .key((item: HDMGoodsItem, index: number) => `${index}_${JSON.stringify(item)}`)

      }
      .cachedCount(1)
      .nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST, // 父组件先滚动
        scrollBackward: NestedScrollMode.SELF_FIRST
      })
      .columnsTemplate(
        new BreakPointType({
          sm: '1fr 1fr',
          md: '1fr 1fr 1fr',
          lg: '1fr 1fr 1fr 1fr',
        }).getValue(this.breakObj.breakPoint)
      )
      .rowsGap(10)
      .columnsGap(10)
      .onReachEnd(async () => {
        if (!this.loading && !this.finished) {
          this.loading = true
          await this.getGuessList()
          this.loading = false
        }
      })
    }
    .height("100%")
    // .height(`calc(100% - ${this.appSafe.topHeight}vp)`) // calc
    .padding(10)

  }
}