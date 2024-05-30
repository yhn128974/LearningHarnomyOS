@Entry
@Component
struct VideoControlCase {
  @State
  currentSpeed: number = 1
  @State
  isMuted: boolean = false
  @State
  showController: boolean = false
  @State
  currentTime: number = 0
  @State
  videoTime: number = 0
  controller: VideoController = new VideoController()

  build() {
    Row() {
      Column({ space: 20 }) {
        Stack({ alignContent: Alignment.BottomEnd }) {
          Video({
            // 视频源
            src: 'assets/videos/TheRiftbreaker.mp4',
            // 封面图
            previewUri: $r('app.media.1'),
            // 倍速 0.75 ~ 2,0.25一个档
            currentProgressRate: this.currentSpeed,
            // 控制器
            controller: this.controller

          })
            .height(400)
            .objectFit(ImageFit.Contain)// 填充模式
            .autoPlay(true)// 自动播放
            .loop(true)// 循环播放
            .muted(this.isMuted)// 是否静音
            .controls(this.showController)//是否展示控制栏

            .onPrepared((time) => { // 视频准备好了可以获取视频的时长
              this.videoTime = time.duration
            })
            .onUpdate((time) => { // 视频播放中可以获取播放的时长
              this.currentTime = time.time
            })
            .onFullscreenChange((screen) => { // 根据是否全屏判断是否展示控制条
              this.showController = screen.fullscreen
            })
          Row() {
            Button('全屏')
              .onClick(() => {
                this.controller.requestFullscreen(true)
              })
            // 一般不需要手动全屏，可以过几秒自动退出，提示该充值了！
            // Button('退出全屏')
            //   .onClick(() => {
            //     this.controller.exitFullscreen()
            //   })
          }
        }


        Row({ space: 20 }) {
          Text('播放进度：')
          Slider({
            value: $$this.currentTime,
            min: 0,
            max: this.videoTime,
          })
            .layoutWeight(1)// 改变时设置视频播放时长
            .onChange((val) => {
              this.controller.setCurrentTime(val)

            })
        }
        .padding(20)

        Row({ space: 20 }) {
          Text('播放速度：')
          Slider({
            value: $$this.currentSpeed,
            min: 0.75,
            max: 2,
            step: 0.25
          })
            .layoutWeight(1)

        }
        .padding(20)

        Row({ space: 20 }) {
          Button('播放')
            .onClick(() => {
              this.controller.start()
            })
          Button('暂停')
            .onClick(() => {
              this.controller.pause()
            })
          Button('停止')
            .onClick(() => {
              this.controller.stop()
            })
          Button('静音')
            .onClick(() => {
              this.isMuted = !this.isMuted
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}