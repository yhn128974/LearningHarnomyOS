@ComponentV2
export struct HcSkeletonItem {
  @Param
  widthValue: Length = '100%'

  build() {
    Text()
      .height(16)
      .width(this.widthValue)
      .borderRadius(2)
      .backgroundColor($r('app.color.common_gray_bg'))
  }
}