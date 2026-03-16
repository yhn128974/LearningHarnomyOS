@ComponentV2
export struct HDMLoading {
  @Param imageWith: number = 0


  build() {
    Stack({
      alignContent: Alignment.Center
    }) {
      ImageAnimator()
        .images([
          {
            src: $r('app.media.loading_01')
          }, {
          src: $r('app.media.loading_02')
        }, {
          src: $r('app.media.loading_03')
        }, {
          src: $r('app.media.loading_04')
        },
        ])
        .state(AnimationStatus.Running)
        .iterations(-1)
        .aspectRatio(3)
        .width(this.imageWith)
        .height(this.imageWith)
    }
    .width('100%')
    .height('100%')
  }
}