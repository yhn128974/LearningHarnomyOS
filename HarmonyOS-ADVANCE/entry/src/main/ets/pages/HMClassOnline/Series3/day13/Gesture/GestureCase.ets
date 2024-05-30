import { util } from '@kit.ArkTS'

@Entry
@Component
struct GestureCase {
  @State
  showVoice: boolean = false
  @State showbindContentCover: boolean = false
  @State showbindContentCover2: boolean = false

  @Builder
  getContent() {
    Column() {
      Row() {
        Row() {
          Text("删")
            .fontColor(Color.White)
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(Color.Gray)
        .rotate({
          angle: -10
        })

        Row() {
          Text("文")
            .fontColor(Color.White)
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(Color.Gray)
        .rotate({
          angle: 10
        })
      }
      .height(80)
      .width('100%')
      .padding({
        left: 40,
        right: 40
      })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor("rgba(0,0,0,0.4)")
    .onClick(() => {
      this.showVoice = false
    })
  }

  @Builder
  bindContentCoverBuilder() {
    Column() {
      Text('hello there').fontSize(20).fontColor(Color.White)

    }.width('100%').height('100%').opacity(0.8).backgroundColor(Color.Black)
  }

  @Builder
  bindContentCoverBuilder2() {
    Column() {
      Text('HI bindContentCoverBuilder2 ').fontSize(20).fontColor(Color.White)

    }.width('100%').height('100%').opacity(0.8).backgroundColor(Color.Black)
  }

  build() {
    Row() {
      Column() {
        Column() {
          Button("语音")
            .width('100%')
            .type(ButtonType.Normal)
            .gesture(

              GestureGroup(
                // 模式 Exclusive,Parallel,Sequence
                GestureMode.Exclusive,
                //
                LongPressGesture()
                  .onAction(() => {
                    this.showbindContentCover = true
                  })
                  .onActionEnd(() => {
                    this.showbindContentCover = false
                  }),

                TapGesture().onAction(() => {
                  this.showVoice = true
                }),

                PanGesture().onActionStart(() => {
                  this.showbindContentCover2 = true
                }).onActionEnd(() => {
                  this.showbindContentCover2 = false
                })


              )
            )
        }.bindContentCover($$this.showbindContentCover2, this.bindContentCoverBuilder2,
          {
            modalTransition: ModalTransition.NONE
          })
        .padding(20)
        .width('100%')

      }.bindContentCover($$this.showbindContentCover, this.bindContentCoverBuilder,
        {
          modalTransition: ModalTransition.NONE
        })
      .padding(20)
      .width('100%')
    }
    .height('100%')
    .bindContentCover($$this.showVoice, this.getContent,
      {
        modalTransition: ModalTransition.NONE
      })
  }
}