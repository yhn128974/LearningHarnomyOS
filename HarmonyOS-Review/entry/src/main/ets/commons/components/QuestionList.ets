import { QuestionItemComp } from "."
import { getQuestList, QuestionItem, SortType } from "../../models";
import { JSON } from "@kit.ArkTS";
import { promptAction } from "@kit.ArkUI";

@ComponentV2
export struct QuestionList {
  @Param typeId: number = 0;
  @Local page: number = 1
  @Param sort: SortType = SortType.Default
  // @Param keyword: string = ''
  //
  @Local isRefreshing: boolean = false
  @Local isFinish: boolean = false
  @Local isLoading: boolean = false
  @Local list: QuestionItem[] = []

  @Builder
  loadMoreBuilder() {
    if (this.isLoading) {
      Row() {
        LoadingProgress().width(20)
        Text('new data is loading...').fontColor(Color.Gray).fontSize(14)

      }.width('100%').justifyContent(FlexAlign.Center).height(75)
    } else if (this.isFinish) {
      Row() {
        Text('no more data now!').fontColor(Color.Gray).fontSize(14)
      }.width('100%').justifyContent(FlexAlign.Center).height(75)
    }
  }

  aboutToAppear(): void {
    this.onload()
  }

  async onload() {

    // setTimeout(() => {
    //   let newList: number[] = new Array(10).fill(0)
    //   this.list.push(...newList)
    //   this.isLoading = false
    //   if (this.list.length >= 40) {
    //     this.isFinish = true
    //   }
    // }, 1000)

    const res = await getQuestList(this.typeId, this.page, this.sort)
    this.list.push(...res.rows)
    this.isLoading = false


    if (this.list.length >= res.total) {
      this.isFinish = true
    } else {
      this.page++
    }
  }

  //
  async onRefresh() {
    this.page = 1
    const res = await getQuestList(this.typeId, this.page, this.sort)
    this.list = res.rows
    this.isRefreshing = false

    if (this.page >= res.pageTotal) {
      this.isFinish = true
    } else {
      this.isFinish = false
      // this.page++
    }
    promptAction.openToast({
      message: "update success"
    })
  }

  build() {
    Column() {
      Refresh({
        refreshing: this.isRefreshing!!
      }) {
        List() {

          ForEach(this.list, (item: QuestionItem) => {
            ListItem() {
              QuestionItemComp({
                item
              })
            }
          })

          ListItem() {
            this.loadMoreBuilder()
          }

        }
        .width('100%')
        .height('100%')
        .onReachEnd(() => {

          if (this.isLoading || this.isFinish) {
            return
          } else {
            this.isLoading = true
            //条用请求函数
            this.onload()
          }
        })
        .edgeEffect(EdgeEffect.None)
        .scrollBar(BarState.Off)
      }.onRefreshing(() => {

        this.onRefresh()

        // setTimeout(() => {
        //   this.isRefreshing = false
        // }, 1000)


      })
    }
  }
}

