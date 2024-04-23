import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct LongPressGestureCase {
  @State message: string = 'Hello World';
  @State showVoice: boolean = false

  @Builder
  bindContentCoverBuilder() {
    Column() {
      Row() {
        Text('删除')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(Color.Gray)
          .fontSize(30)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(40)// 逆时针
          .rotate({ angle: -60 })


        Text('文本')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(Color.Gray)
          .fontSize(30)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(40)// 顺时针
          .rotate({ angle: 60 })
      }.padding({
        left: 40,
        right: 40
      })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween).translate({
        y: '-100%'
      })
    }
    .backgroundColor('rgba(0,0,0,0.7)')
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Row() {
      Column() {
        Button('长安触发')
          .gesture(
            LongPressGesture()
              .onAction(() => {
                this.showVoice = true
              })
              .onActionEnd(() => {
                this.showVoice = false
              })

          )
          .width('100%')
          .height(40)
          .type(ButtonType.Normal)

      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .height('100%')
      .padding(20)
    }
    .height('100%')
    .bindContentCover($$this.showVoice, this.bindContentCoverBuilder(), {
      modalTransition: ModalTransition.NONE
    })
  }
}