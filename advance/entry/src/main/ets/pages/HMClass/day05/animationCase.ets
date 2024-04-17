// xxx.ets
@Entry
@Component
struct ImageAnimatorExample {
  // 快速生成 ImageFrameInfo 数组
  images: ImageFrameInfo[] = Array.from<string>({ length: 4 }).map<ImageFrameInfo>((v: string, index: number) => {
    return {
      src: `/common/day04_05/02.animator/watch-loadingdog-${index}@2x.png`,
    }
  })

  build() {
    Column({ space: 10 }) {
      ImageAnimator()
        .images(this.images)
        .duration(500)// 持续
        .state(AnimationStatus.Running)// 动画状态
        .iterations(-1)// 播放次数
        .animatorFancy()
    }
    .width('100%')
    .height('100%')
  }

  @Styles
  animatorFancy() {
    .width(200)
    .aspectRatio(2)
    .padding(10)
    .borderRadius(10)
  }
}