import { VideoItem, allData } from './models'
import { Popup } from '@ohos.arkui.advanced.Popup';

@Entry
@Component
struct DouYingPage {
  @State message: string = 'Hello World';
  @Provide activeIndex: number = 0

  build() {
    Row() {
      Swiper() {
        ForEach(allData, (item: VideoItem, index: number) => {
          PlayVideo({ item, itemindex: index })
        })

      }
      //cache:高速缓存 /缓存
      .index($$this.activeIndex)
      // 预加载
      .cachedCount(3)
      // 循环
      .loop(false)
      // 指示器
      .indicator(false)
      // 垂直滑动
      .vertical(true)
      .width('100%')
      .height('100%')
    }
  }
}

@Component
struct PlayVideo {
  @State istart: Boolean = true
  @Prop item: VideoItem = new VideoItem()
  @Prop itemindex: number = 0
  @Consume
  @Watch('handleVideoChange')
  activeIndex: number
  contorller: VideoController = new VideoController()

  // aboutToAppear(): void {
  //   this.handleVideoChange()
  // }

  handleVideoChange() {
    if (this.activeIndex === this.itemindex && this.istart === true) {

      this.contorller.start()
    }
    else {
      this.contorller.pause()
    }
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {

      Column() {
        Video({
          src: this.item.videoUrl,
          controller: this.contorller
        })
          .onClick(() => {
            this.istart = !this.istart
            this.handleVideoChange()
          })
          .autoPlay(this.itemindex===this.activeIndex)
          .width('100%')
          .aspectRatio(1.4)
          .controls(false)
      }
      .width('100%')
      .backgroundColor(Color.Black)
      .height('100%').justifyContent(FlexAlign.Center)

      Row() {
        Text(this.item.title)
          .width('100%')
          .padding(20)
          .fontSize(20)
          .lineHeight(30)
          .fontColor(Color.White)
      }
    }
  }
}