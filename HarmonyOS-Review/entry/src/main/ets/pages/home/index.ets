import { HcClockIn } from "../../commons/components/HcClockIn"
import { HcSearchBox } from "../../commons/components/HcSearchBox"
import { HomeCategory } from "./comps/HomeCategory"
import { mockQuestionTypeList, QuestionType } from "./models/QuestionType"


@ComponentV2
export struct HomePage {
  // @StorageProp('topHeight') topHeight: number = 0


  @Local swiperList: ResourceStr[] = [
    $r('app.media.banner_ai'),
    $r('app.media.banner_pj'),
    $r('app.media.banner_qa')
  ]

  @Builder
  SwiperItemBuilder(item: ResourceStr, index: number) {
    Row() {
      Image(item).width('100%').objectFit(ImageFit.Fill)
    }
  }

  build() {
    Column() {
      Row({ space: 16 }) {
        Image($r('app.media.ic_home_scan'))
          .width(24)
          .aspectRatio(1)
        Blank()
        // TODO 搜索组件
        HcSearchBox({
          layoutWeightValue: 1
        })

        //TODO 打开组件
        HcClockIn({
          clockInCount: 3
        })
      }
      .padding({ left: 16, right: 16 })
      .height(64)
      .width('100%')

      //轮播图
      Swiper() {
        ForEach(this.swiperList, (item: ResourceStr, index) => {
          this.SwiperItemBuilder(item, index)
        })
      }.width('100%').height(100).padding({ left: 16, right: 16 })

      //试题列表
      Column() {
        HomeCategory()
      }.padding({ left: 16, right: 16 })
      .width('100%')
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))

    }

    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.common_gray_bg'))
  }
}