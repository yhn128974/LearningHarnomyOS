@ComponentV2
export struct HDMCellGroup {
  @BuilderParam
  default: () => void = this.getDefaultBuilder

  @Builder
  getDefaultBuilder() {
  }

  build() {
    Column() {
      if (this.default) {
        this.default() // 调用传入的UI结构
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width("100%")
    .border({
      width: { top: 0.6, bottom: 0.6 },
      color: $r('app.color.under')
    })
    .padding({ left: 16, right: 16 })
    .backgroundColor($r("app.color.white"))
  }
}