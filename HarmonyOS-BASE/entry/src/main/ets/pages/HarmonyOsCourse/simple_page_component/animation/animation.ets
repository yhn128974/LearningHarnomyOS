import { prompt } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State imageWith: number = 100
  @State imageHight: number = 100
  @State iscore: boolean = false;

  @Builder
  ImageCat() {
    if (!this.iscore) {
      Image($r('app.media.cat'))

        .stateStyles({
          pressed: {
            .width(this.imageWith)
            .height(this.imageHight)
            .translate({
              x: 100,
            })
            .opacity(0.5)
          }
        })
        .animation({
          duration: 1000,
          tempo: 1.0,
          delay: 0,
          curve: Curve.Linear,
          playMode: PlayMode.Reverse,
          iterations: 1,
          onFinish: () => {
            this.iscore = !this.iscore
            console.warn('animation finished.');
          }
        })
    } else {
      Text('cat was detected')
    }
  }

  build() {
    Row() {
      this.ImageCat()
    }

  }
}