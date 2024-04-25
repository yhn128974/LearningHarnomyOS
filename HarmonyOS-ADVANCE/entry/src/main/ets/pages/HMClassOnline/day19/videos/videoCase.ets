@Entry
@Component
struct VideoCase {
  @State message: string = 'Hello World';
  //音视频播放控制对象
  controller: VideoController = new VideoController()
  @State Rate: number = 1

  build() {
    Row() {
      Column() {
        // 必须要求模拟器
        Video({ src: 'assets/videos/TheRiftbreaker.mp4' })
          .width('100%')
          .height(200)

        Video({
          src: 'assets/audio/amazing_grace.mp3',
          controller: this.controller,
          currentProgressRate: this.Rate//0.75 1 1.25 1.5 1.75 2
        })
          .width('100%')
          .height(200)
          .controls(false)

        Row() {
          Button('播放').onClick((event: ClickEvent) => {
            this.controller.start()
          })
          Button('暂停').onClick((event: ClickEvent) => {
            this.controller.pause()
          })
        }

        Slider({
          min: 0.75,
          max: 2,
          value: $$this.Rate,
          step: 0.25
        })
        Divider()

        Video({ src: $rawfile('callofdutydemo.mp4') })
          .width('100%')
          .height(200)

      }
      .width('100%')
    }
    .height('100%')
  }
}