@ComponentV2
export struct HcSearchBox {
  @Param boxWidth: Length = 100
  @Param boxHeight: number = 32
  @Param ph: ResourceStr = '搜索题目'
  @Param phColor: ResourceColor = $r('app.color.common_gray_02')
  @Param bgColor: ResourceColor = $r('app.color.common_gray_border')
  @Param layoutWeightValue: number = 0

  build() {
    Row({ space: 4 }) {
      Image($r('app.media.ic_common_search'))
        .width(14)
        .aspectRatio(1)
        .fillColor(this.phColor)
      Text(this.ph)
        .fontSize(14)
        .fontColor(this.phColor)
    }
    .width(this.boxWidth)
    .height(this.boxHeight)
    .backgroundColor(this.bgColor)
    .borderRadius(this.boxHeight / 2)
    .justifyContent(FlexAlign.Center)
    .layoutWeight(this.layoutWeightValue)
  }
}