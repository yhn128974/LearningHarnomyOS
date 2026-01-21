import { mockQuestionTypeList, QuestionType, Tag } from "../models/QuestionType"

@ComponentV2
export struct HomeCategory {
  @Local currentIndex: number = 0
  @Local currentMockQuestionTypeList: QuestionType[] = mockQuestionTypeList

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
      right: 10
    })

  }

  @Builder
  ItemList(item: Tag) {
    Text(item.tagName)

  }

  build() {
    Tabs() {
      ForEach(this.currentMockQuestionTypeList, (Question: QuestionType, index) => {
        TabContent() {
          //
          List() {
            ForEach(Question.tags, (item: Tag) => {
              this.ItemList(item)
            })
          }
        }.tabBar(this.CategoryBar(Question, index))

      })
    }.barMode(BarMode.Scrollable).barHeight(44).divider({
      strokeWidth: 0.5,
      color: $r('app.color.common_gray_border')
    }).onChange((value) => {
      this.currentIndex = value
    })
  }
}