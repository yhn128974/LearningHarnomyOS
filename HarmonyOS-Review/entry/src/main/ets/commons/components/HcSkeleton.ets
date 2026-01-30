@ComponentV2
export struct HcSkeleton {
  @Local opacityValue: number = 1
  @BuilderParam
  default: () => void = this.defaultBuilder

  @Builder
  defaultBuilder() {
  }

  build() {
    Row({ space: 15 }) {
      this.default()
    }
    .opacity(this.opacityValue)
    .animation({
      iterations: -1,
      duration: 600,
      playMode: PlayMode.Alternate,
      curve: Curve.EaseInOut
    })
    .onAppear(() => {
      this.opacityValue = 0.5
    })

  }
}