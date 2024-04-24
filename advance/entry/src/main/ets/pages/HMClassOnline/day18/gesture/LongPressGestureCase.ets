import { display, promptAction } from '@kit.ArkUI';


enum SelectType {
  DELETE,
  TEXT,
  NONE
}

@Entry
@Component
struct LongPressGestureCase {
  @State message: string = 'Hello World';
  @State showVoice: boolean = false
  @State currentMode: SelectType = SelectType.NONE
  @State screenWidth: number = 0

  @Builder
  bindContentCoverBuilder() {
    Column() {
      Row() {
        Text('删除')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(this.currentMode === SelectType.DELETE ? Color.Red : Color.Gray)
          .fontSize(30)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(40)// 逆时针
          .rotate({ angle: -60 })


        Text('文本')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(this.currentMode === SelectType.TEXT ? Color.Red : Color.Gray)
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

  aboutToAppear(): void {
    display.getAllDisplays().then(res => {
      promptAction.showToast({
        message: px2vp(res[0].width).toString(),
        duration: 3000
      })
    })
  }

  build() {
    Row() {
      Column() {
        Button('长安触发')
          .width('100%')
          .height(40)
          .type(ButtonType.Normal)
          .gesture(
            GestureGroup(
              GestureMode.Parallel,
              LongPressGesture()
                .onAction(() => {
                  this.showVoice = true
                })
                .onActionEnd(() => {
                  this.showVoice = false
                }),
              PanGesture()
                .onActionUpdate((event) => {
                  if (event.fingerList[0].globalX < this.screenWidth / 2) {
                    this.currentMode = SelectType.DELETE
                  } else {
                    this.currentMode = SelectType.TEXT
                  }
                })
                .onActionEnd(() => {
                  this.currentMode = SelectType.NONE
                })
            )

          )
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
    //最外层的容器宽高为100%,通过onAreaChange参数可以拿到屏幕的宽高
    .onAreaChange((oldArea, newArea) => {
      this.screenWidth = newArea.width as number
      // promptAction.showToast({
      //   message: this.screenWidth.toString()
      // })
    })
  }
}