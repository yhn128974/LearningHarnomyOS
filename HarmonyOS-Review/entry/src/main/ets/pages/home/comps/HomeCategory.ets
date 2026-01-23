import axios, { Axios, AxiosResponse } from "@ohos/axios"
import { QuestionList } from "../../../commons/components"
import { baseURL, httpClient } from "../../../commons/utils/http/httpClient"
import { AxiosRes, mockData, QuestionType } from "../models/QuestionType"
import { JSON } from "@kit.ArkTS"
import { FilterButton } from "./FilterButton"

@ComponentV2
export struct HomeCategory {
  @Local currentIndex: number = 0
  @Local currentMockQuestionTypeList: QuestionType[] = mockData
  @Local isShowBindSheet: boolean = false

  @Builder
  FilterSheetBuilder() {
    Column() {
      Row() {
        Text('重置')
          .fontSize(16)
          .fontWeight(500)
          .fontColor($r('app.color.common_gray_03'))
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
        FilterButton({ text: '默认' })
        FilterButton({ text: '浏览量', isSort: true })
        FilterButton({ text: '难度', isSort: true })
        FilterButton({ text: '推荐' })
      }

      Text('选择分类')
        .textTitle()
      // TODO 筛选按钮
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.currentMockQuestionTypeList, (item: QuestionType) => {
          FilterButton({
            text: item.name,
            isNew: item.displayNewestFlag === 1
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

  async getQuestList() {
    const res = await httpClient.request<QuestionType[]>({
      url: '/question/type',
      method: 'get',
    })
    this.currentMockQuestionTypeList = res
  }

  build() {
    Stack({
      alignContent: Alignment.TopEnd
    }) {
      Tabs() {
        ForEach(this.currentMockQuestionTypeList, (Question: QuestionType, index) => {
          TabContent() {
            QuestionList({
              typeId: Question.id
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
      }).onChange((value) => {
        this.currentIndex = value
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

@Extend(Text)
function textTitle() {
  .fontSize(14)
  .fontWeight(500)
  .fontColor($r('app.color.black'))
  .width('100%')
  .margin({ top: 20 })
}