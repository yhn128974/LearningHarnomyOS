import { allData, VideoItem } from './model';
import { componentSnapshot } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@ComponentV2
struct DouYingCasePage {
  @Local videoList: VideoItem[] = allData
  @Local currentIndex: number = 0

  build() {
    Column() {
      Swiper() {
        ForEach(this.videoList, (item: VideoItem, index: number) => {
          VideoComp({
            currenModel: item,
            Index: index,
            currentIndex: this.currentIndex

          })
        })
      }.vertical(true).cachedCount(3).index(this.currentIndex!!).indicator(false)

    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct VideoComp {
  @Param currenModel: VideoItem = {} as VideoItem
  @Param Index: number = 0
  @Param currentIndex: number = 0
  controller: VideoController = new VideoController()
  @Local previewImage: image.PixelMap | undefined = undefined

  @Monitor('currentIndex')
  isPlaying() {
    if (this.Index !== this.currentIndex) {
      this.controller.pause()
    } else {
      this.controller.start()
    }
  }

  build() {
    Row() {
      Stack({
        alignContent: Alignment.Bottom
      }) {
        Video({
          src: this.currenModel.videoUrl,
          controller: this.controller,
          previewUri: this.previewImage
        })
          .id('video' + this.Index.toString())
          .autoPlay(this.Index == this.currentIndex)
          .loop(true)
          .controls(false)
          .objectFit(ImageFit.Contain)
          .onPrepared((data) => {

            componentSnapshot.get('video' + this.Index.toString()).then((vale) => {
              this.previewImage = vale
            })
          })
        Text(this.currenModel.title).padding(12).width('100%').fontColor('#fff')
      }

    }
  }
}