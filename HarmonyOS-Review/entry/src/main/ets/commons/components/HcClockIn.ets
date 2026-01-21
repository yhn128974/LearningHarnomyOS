@ComponentV2
export struct HcClockIn {
  // 大于表示已打卡
  @Param clockInCount: number = 0

  build() {
    Row() {
      if (this.clockInCount > 0) {
        Column() {
          Text('已连续打卡')
            .fontColor($r('app.color.black'))
            .fontSize(8)
          Text() {
            Span(this.clockInCount.toString())
              .fontSize(12)
              .fontWeight(600)
            Span('天')
              .fontSize(10)
          }
          .fontColor($r('app.color.black'))
        }
        .margin({ left: 30 })
      } else {
        Text('打卡')
          .fontColor($r('app.color.black'))
          .fontSize(18)
          .fontWeight(500)
          .margin({ left: 30, top: -4 })
      }
    }
    .width(74)
    .height(28)
    .backgroundImage(this.clockInCount > 0 ? $r('app.media.ic_common_unclock') : $r('app.media.ic_common_clocked'))
    .backgroundImageSize(ImageSize.Contain)
  }
}