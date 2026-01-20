import { display, promptAction } from '@kit.ArkUI';

enum GestureState {
  Default,
  Delete,
  Text
}

@Entry
@ComponentV2
struct GesturePage {
  @Local isShowContentCover: boolean = false;
  @Local screenX: number = 0
  @Local gestureState: GestureState = GestureState.Default

  aboutToAppear(): void {
    this.screenX = this.getUIContext().px2vp(display.getDefaultDisplaySync().width)
  }

  @Builder
  currentContentCover() {
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
        .backgroundColor(this.gestureState == GestureState.Delete ? Color.Red : Color.Gray)
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
        .backgroundColor(this.gestureState == GestureState.Text ? Color.Red : Color.Gray)
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
  }

  build() {
    Column() {
      Button('语音').gesture(

        GestureGroup(GestureMode.Parallel,
          LongPressGesture()
            .onAction(() => {
              this.isShowContentCover = true
            })
            .onActionEnd(() => {
              this.isShowContentCover = false
              this.gestureState = GestureState.Default
            }),
          PanGesture()
            .onActionUpdate((event) => {
              //屏幕的宽度

              if (event.fingerList[0].globalX > this.screenX / 2) {
                promptAction.openToast({
                  message: "在右边"
                })
                this.gestureState = GestureState.Text
              } else {
                promptAction.openToast({
                  message: "在左边"
                })
                this.gestureState = GestureState.Delete
              }
            })
        ),


      )
    }
    .width('100%')
    .height('100%')
    .bindContentCover(this.isShowContentCover, this.currentContentCover)
  }
}