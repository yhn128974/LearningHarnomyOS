import image from '@ohos.multimedia.image';
import { ComponentSnapshot } from '@ohos.arkui.UIContext';
import { componentSnapshot } from '@kit.ArkUI';
import { media } from '@kit.MediaKit';

@Entry
@ComponentV2
struct VideoPage {
  @Local message: string = 'Hello World';
  @Local current: number = 0
  @Local total: number = 0
  controller: VideoController = new VideoController()
  @Local preViewImage: image.PixelMap | undefined = undefined

  build() {
    Column() {

      Button('组件截图').onClick(() => {
        componentSnapshot.get('myVideo', (err, img) => {
          this.preViewImage = img
        })
      })

      Video({
        src: 'https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4',
        controller: this.controller,
        previewUri: this.preViewImage
      })
        .onAppear(async () => {


          //获取第一帧
          // const generator = await media.createAVImageGenerator()
          // generator.fdSrc = this.getUIContext()
          //   .getHostContext()?.resourceManager.getRawFdSync('https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4')
          // this.preViewImage =
          //   await generator.fetchFrameByTime(1000, media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC, {
          //     width: 400,
          //     height: 300
          //   })

          //简单方式
          componentSnapshot.get('myVideo', (err, img) => {
            this.preViewImage = img
          })


        })
        .id('myVideo')
        .width('100%')
        .height(300)
        // .autoPlay(true)
        // .loop(true)//循环播放
        // .muted(true)//静音
        .objectFit(ImageFit.Contain)
        //是否展示进度条
        .controls(true)
        .onPrepared((total) => {
          this.total = total.duration //获取总时长
        })
        .onUpdate((current) => {
          this.current = current.time //获取当前进度
        })


      Row() {
        Text(this.current.toString())
        Slider({
          min: 0,
          value: this.total,
          max: this.total
        }).width('90%').layoutWeight(1).onChange((value) => {
          this.controller.setCurrentTime(value, SeekMode.NextKeyframe)
        })
        Text(this.total.toString())
      }

      Flex() {
        Button('播放').onClick(() => {
          this.controller.start()
        })
        Button('暂停').onClick(() => {
          this.controller.pause()
        })
        Button('停止').onClick(() => {
          this.controller.stop()
        })
        Button('全屏').onClick(() => {
          this.controller.requestFullscreen(true)
        })

      }

      Image(this.preViewImage)

      // Video({
      //   src: $rawfile('travel.mp4')
      // })
      //   .width('100%')
      //   .aspectRatio(1.4)

    }
    .height('100%')
    .width('100%')
  }
}