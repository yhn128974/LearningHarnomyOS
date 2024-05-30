import { asset } from '@kit.AssetStoreKit'

@Entry
@Component
struct VideoCase {
  @State
  speed: number = 1
  controller: VideoController = new VideoController()
  build() {
    Row() {
      Tabs() {
        TabContent() {
          Column({ space: 20 }) {
            Video({
              currentProgressRate: this.speed,
              src: 'https://vd3.bdstatic.com/mda-pmj5ajqd7p4b6pgb/576p/h264/1703044058699262355/mda-pmj5ajqd7p4b6pgb.mp4?auth_key=1703138418-0-0-618ea72b33be241c96c6cff86c06e080&bcevod_channel=searchbox_feed&cr=1&cd=0&pd=1&pt=4&logid=0018430194&vid=9762003448174112444&abtest=all'
            })
              .width('100%')
              .aspectRatio(1.4)
              .objectFit(ImageFit.Contain)
            Slider({
              value: this.speed,
              min: 0.75,
              step: 0.25,
              max: 2,
              style: SliderStyle.InSet
            })
              .showSteps(true)
              .onChange(value => {
                this.speed = value
              })
            Text(this.speed+"倍速").fontSize(14).textAlign(TextAlign.Center).width('100%')

          }
          .width('100%')
        }.tabBar("在线视频")
        TabContent() {
          Video({
            src: 'assets/videos/TheRiftbreaker.mp4',
            controller:this.controller
          })
            .width('100%')
            .aspectRatio(1.4)
            .controls(false)
        }
        .tabBar("本地视频")
      }
      .animationDuration(300)

    }
    .height('100%')
  }
}