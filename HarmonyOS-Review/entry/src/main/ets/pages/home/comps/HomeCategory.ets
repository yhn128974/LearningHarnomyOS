import { QuestionList } from "../../../commons/components"
import { httpClient } from "../../../commons/utils/http/httpClient"
import { mockData, QuestionType } from "../models/QuestionType"

import { FilterButton, filterButtonList, FilterButtonModel } from "./FilterButton"
import { SortType } from '../../../models'
import { HcSkeletonItem } from "../../../commons/components/HcSkeletonItem"
import { HcSkeleton } from "../../../commons/components/HcSkeleton"

@ComponentV2
export struct HomeCategory {
  @Local currentMockQuestionTypeList: QuestionType[] = []
  @Local isShowBindSheet: boolean = false
  //当初状态
  @Local currentIndex: number = 0
  //保存用于选择的一个临时状态
  @Local tempSelectIndex: number = this.currentIndex
  @Local sort: SortType = SortType.Default
  @Local tempSelectSortType: SortType = this.sort
  @Local isLoading: boolean = true

  @Builder
  FilterSheetBuilder() {
    Column() {
      Row() {
        Text('重置')
          .fontSize(16)
          .fontWeight(500)
          .fontColor($r('app.color.common_gray_03'))
          .onClick(() => {
            this.tempSelectIndex = 0
            this.tempSelectSortType = SortType.Default
          })
        Text('筛选题目')
          .layoutWeight(1)
          .fontSize(18)
          .fontWeight(500)
          .fontColor($r('app.color.black'))
          .textAlign(TextAlign.Center)
        Text('完成')
          .fontWeight(500)
          .fontSize(16)
          .fontColor($r('app.color.common_main_color'))
          .onClick(() => {
            this.sort = this.tempSelectSortType
            this.currentIndex = this.tempSelectIndex
            this.isShowBindSheet = false
          })
      }
      .margin({ bottom: 4, top: 4 })

      Text('题目排序')
        .textTitle()
      // TODO 筛选按钮
      Flex({
        wrap: FlexWrap.Wrap
      }) {
        ForEach(filterButtonList, (item: FilterButtonModel) => {
          FilterButton({ text: item.text, isSort: item.isSort, selected: this.tempSelectSortType === item.sortType })
            .onClick(() => {
              this.tempSelectSortType = item.sortType
            })
        })
      }

      Text('选择分类')
        .textTitle()
      // TODO 筛选按钮
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.currentMockQuestionTypeList, (item: QuestionType, index: number) => {
          FilterButton({
            text: item.name,
            isNew: item.displayNewestFlag === 1,
            selected: this.tempSelectIndex === index
          }).onClick(() => {
            this.tempSelectIndex = index
          })

        })
      }
    }
    .padding(16)
    .backgroundColor($r('app.color.white'))
    .height('100%')
  }

  @Builder
  CategoryBar(Question: QuestionType, index: number) {

    Row() {
      Stack({
        alignContent: Alignment.Bottom
      }) {
        Text(Question.name).padding({
          left: 20,
          right: 20
        }).fontSize(15).height(44)

        if (index == this.currentIndex) {
          Text().width(20).height(2).backgroundColor($r('app.color.black'))
        }
      }

      if (Question.displayNewestFlag === 1) {
        Image($r('app.media.ic_home_new'))
          .height(14)
          .width(32)
          .objectFit(ImageFit.Contain)
      }
    }.padding({
      left: 10,
      right: index === this.currentMockQuestionTypeList.length - 1 ? 56 : 10
    })

  }

  aboutToAppear(): void {
    this.getQuestList()
  }

  @Builder
  SkeletonBuilder() {
    HcSkeleton() {
      Column() {
        Row({ space: 16 }) {
          HcSkeletonItem({ widthValue: 60 })
          HcSkeletonItem({ widthValue: 100 })
          HcSkeletonItem({ widthValue: 80 })
          HcSkeletonItem({ widthValue: 40 })
        }
        .height(44)
        .width('100%')

        ForEach([1, 2, 3, 4, 5, 6], () => {
          Column({ space: 10 }) {
            HcSkeletonItem({ widthValue: '90%' })
            HcSkeletonItem({ widthValue: '45%' })
          }
          .height(80)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .justifyContent(FlexAlign.Center)
        })
      }
      .padding({ left: 16, right: 16 })
    }
  }

  async getQuestList() {
    const res = await httpClient.request<QuestionType[]>({
      url: '/question/type',
      method: 'get',
    })
    this.currentMockQuestionTypeList = res
    this.isLoading = false
  }

  build() {

    if (this.isLoading) {
      this.SkeletonBuilder()
    } else {
      Stack({
        alignContent: Alignment.TopEnd
      }) {
        Tabs({
          index: this.currentIndex
        }) {
          ForEach(this.currentMockQuestionTypeList, (Question: QuestionType, index) => {
            TabContent() {
              QuestionList({
                typeId: Question.id,
                sort: this.sort,
                index: index,
                currentIndexId: this.currentIndex
              })
            }
            .tabBar(this.CategoryBar(Question, index))
            .align(Alignment.TopStart)

          })
        }

        .barMode(BarMode.Scrollable)
        .barHeight(44)
        .divider({
          strokeWidth: 0.5,
          color: $r('app.color.common_gray_border')
        })
        // .onChange((value) => {
        //   this.currentIndex = value
        // }) //太慢了
        // .animationDuration(0) //关闭动画可以解决tabContent切换时中间内容被激活的问题
        //效果点击谁就直接切换到谁不会有中间的加载过程
        .onTabBarClick((index) => {
          this.currentIndex = index
          this.tempSelectIndex = this.currentIndex
        })

        Row() {
          Image($r('app.media.ic_home_filter')).width(24).aspectRatio(1)
        }
        .width(56)
        .height(44)
        .justifyContent(FlexAlign.Center)
        //线性渐变
        .linearGradient({
          angle: 90,
          colors: [['#00ffffff', 0], [Color.White, 0.3]]
        })
        .bindSheet(this.isShowBindSheet!!, this.FilterSheetBuilder, {
          showClose: false,
          height: 400,
        })
        .onClick(() => {
          this.isShowBindSheet = true
        })
      }
    }


  }
}

@Extend(Text)
function textTitle() {
  .fontSize(14)
  .fontWeight(500)
  .fontColor($r('app.color.black'))
  .width('100%')
  .margin({ top: 20 })
}