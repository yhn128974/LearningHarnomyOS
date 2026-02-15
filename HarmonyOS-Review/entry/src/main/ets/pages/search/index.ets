import { AreaHeight } from "../../models"
import { AppStorageV2 } from "@kit.ArkUI"
import { navPathStack } from "../../commons/utils"
import { SearchHistory } from "./comp/SearchHistory"
import { QuestionList } from "../../commons/components/QuestionList"


@ComponentV2
struct SearchPage {
  @Local areaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => new AreaHeight(0, 0))!
  @Local keyword: string = ''
  @Local isSearch: boolean = false

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        Row({ space: 16 }) {
          Search({ placeholder: '请输入试题关键字', value: this.keyword })
            .placeholderFont({ size: 14 })
            .height(32)
            .layoutWeight(1)
            .defaultFocus(true)
            .onSubmit((value) => {
              this.keyword = value
              if (this.keyword) {
                this.isSearch = true
              }
            })
            .onChange(value => {
              // this.keyword = value
              if (!value) {
                this.isSearch = false
              }
            })
          Text('取消')
            .fontColor($r('app.color.black'))
            .fontSize(15)
            .fontWeight(500)
            .onClick(() => navPathStack.pop())
        }
        .height(64)
        .padding({ left: 16, right: 16 })
        .border({ width: { bottom: 0.5 }, color: $r('app.color.common_gray_border') })

        Column() {
          if (this.isSearch) {
            // TODO 试题列表
            QuestionList({
              typeId: 0,
              keyword: this.keyword
            })
          } else {
            SearchHistory({
              onSearch: keyword => {
                // TODO 进行搜索
              }
            })
          }
        }
        .layoutWeight(1)
      }
      .padding({ top: this.areaHeight.voidAreaTopHeight })
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function SearchBuilder() {
  SearchPage()
}