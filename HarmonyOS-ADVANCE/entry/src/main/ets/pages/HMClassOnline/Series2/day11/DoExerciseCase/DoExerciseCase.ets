import { QuestionInfo, QuestionInfoModel, OptionItemModel, OptionItem, UserAnswer } from './models'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WatchBigCase {
  @State
  list: QuestionInfoModel[] = []
  @State currentIndex: number = 1
  @State currentInfoModel: QuestionInfoModel = new QuestionInfoModel({} as QuestionInfo)
  // Partial 将内部的所有字段变为可选类型
  //  @State answer:Partial<UserAnswer>={}

  @State
  // {1:{},2:{},3:{}}
  answerMap: Record<number, UserAnswer> = {}

  aboutToAppear(): void {
    this.getQuestionList()
  }

  async getQuestionList() {

    this.list = await new Promise<QuestionInfoModel[]>((resolve) => {
      setTimeout(() => {
        resolve([
          new QuestionInfoModel({
            id: 1,
            title: '下面说法正确的是',
            options: [
              new OptionItemModel({
                optionTitle: "鸿蒙和openharmony是一回事",
                letter: 'A'
              }),
              new OptionItemModel({
                optionTitle: "鸿蒙的装饰器不可以做响应式",
                letter: 'B'
              }),
              new OptionItemModel({
                optionTitle: "arkTS借鉴了TS的语法",
                letter: 'C'
              }),
              new OptionItemModel({
                optionTitle: "鸿蒙4.0已经面世1年了",
                letter: 'D'
              })
            ]
          }),
          new QuestionInfoModel({
            id: 2,
            title: '哪个修饰符不具备响应式',
            options: [
              new OptionItemModel({
                optionTitle: "State",
                letter: 'A'
              }),
              new OptionItemModel({
                optionTitle: "Link",
                letter: 'B'
              }),
              new OptionItemModel({
                optionTitle: "Prop",
                letter: 'C'
              }),
              new OptionItemModel({
                optionTitle: "Preview",
                letter: 'D'
              })
            ]
          }),
          new QuestionInfoModel({
            id: 3,
            title: 'Link的用法下面哪个语法是正确的',
            options: [
              new OptionItemModel({
                optionTitle: "$$this.xxx",
                letter: 'A'
              }),
              new OptionItemModel({
                optionTitle: "$.xxx",
                letter: 'B'
              }),
              new OptionItemModel({
                optionTitle: "$this.xxx",
                letter: 'C'
              }),
              new OptionItemModel({
                optionTitle: "$$xxx",
                letter: 'D'
              })
            ]
          })
        ])

      }, 300)
    })

    this.currentInfoModel = this.list[this.currentIndex-1]
  }

  @Styles
  imgStyle() {
    .width(20)
    .height(20)

  }

  @Builder
  getTopContent() {
    Row() {
      Image($r("app.media.ic_public_left_arrow"))
        .imgStyle()
      Text("在线模拟")
      Image($r("app.media.read"))
        .imgStyle()
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(40)
  }

  @Builder
  getQuestionContent() {
    Column({
      space: 10
    }) {
      Text('单选题').padding(5).backgroundColor('#ccc')
      Text(this.currentInfoModel.title)
      List({
        space: 10
      }) {
        ForEach(this.currentInfoModel.options, (item: OptionItemModel, index: number) => {
          ListItem() {
            Row() {
              Text(`${item.letter}.   ${item.optionTitle} `)
            }
            .width('100%')
            .borderRadius(5)
            .backgroundColor('#ddd')
            .height(40)
            .padding(10)
            .border({
              color: this.answerMap[this.currentInfoModel.id]?.user_answer === item.letter ? Color.Green : Color.Gray,
              style: BorderStyle.Solid,
              width: 2
            })
            .onClick(() => {

              // [字段]取字段 在object或者record中被NEXT支持
              this.answerMap[this.currentInfoModel.id] = {
                question_id: this.currentInfoModel.id,
                user_answer: item.letter,
                user_id: '001'
              }

            })
          }
        })
      }

    }.padding(20).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Start)
  }

  @Builder
  getBottomContent() {
    Row() {
      Row() {
        Image($r("app.media.ic_public_left_arrow"))
          .imgStyle().fillColor(this.currentIndex > 1 ? '' : '#ccc')
        Text("上一题").fontColor(this.currentIndex > 1 ? '' : '#ccc')
      }.onClick(() => {
        if (this.currentIndex > 1) {
          this.currentIndex--
          this.currentInfoModel = this.list[this.currentIndex-1]
        }
      })

      Row() {
        Text("下一题").fontColor(this.currentIndex < this.list.length ? '' : '#ccc')
        Image($r("app.media.ic_public_left_arrow")).fillColor(this.currentIndex < this.list.length ? '' : '#ccc')
          .imgStyle()
          .rotate({
            angle: 180
          })
      }.onClick(() => {
        if (this.currentIndex < this.list.length) {
          this.currentIndex++
          this.currentInfoModel = this.list[this.currentIndex-1]
        }
      })

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(60)
    .backgroundColor(Color.White)
  }

  build() {
    Column({ space: 20 }) {
      // builder
      this.getTopContent()
      // 进度条
      Row() {
        Progress({ value: this.currentIndex, total: this.list.length }).layoutWeight(1)
        Text(`${this.currentIndex}/${this.list.length}`)
      }

      Column() {
        this.getQuestionContent()

      }
      .layoutWeight(1)

      // 底部区域
      this.getBottomContent()
    }
    .width('100%')
    .height('100%')
    .padding({
      left: 10,
      right: 10
    })
    .backgroundColor(Color.White)
  }
}