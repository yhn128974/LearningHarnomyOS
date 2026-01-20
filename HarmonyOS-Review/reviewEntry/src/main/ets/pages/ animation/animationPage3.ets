@Entry
@ComponentV2
struct AnimationPage3 {
  @Local message: string = 'Hello World';
  @Local isPlay: AnimationStatus = AnimationStatus.Initial

  build() {
    Column() {
      Text('he beginning to running')


      ImageAnimator()
        .images(Array(37).fill(1).map((item: number, index) => {
          return {
            src: `/assets/JDLoading/loading_${index + 1}.png`
          } as ImageFrameInfo
        }))
        .duration(3000)
        .iterations(-1)
        .width(100)
        .height(100)
        .fillMode(FillMode.None)
        .state(this.isPlay)
        .border({
          width: 1
        })

      Button('playing/pause').onClick(() => {

        if (this.isPlay == AnimationStatus.Initial) {
          this.isPlay = AnimationStatus.Running
        }
        // if (this.isPlay == AnimationStatus.Running) {
        //   this.isPlay = AnimationStatus.Stopped
        // }
        // if (this.isPlay = AnimationStatus.Paused) {
        //   this.isPlay = AnimationStatus.Running
        // }
      })

    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}