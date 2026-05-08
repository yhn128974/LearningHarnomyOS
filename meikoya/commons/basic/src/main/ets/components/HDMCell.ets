@ComponentV2
export struct HDMCell {
  @Param
  title: string = ""
  @Param
  icon: ResourceStr = $r("app.media.ic_public_right")
  @Param
  value: string = "" // 后侧的文本
  @Param
  showRightIcon: boolean = true // 是否显示右侧图标
  @Event
  onRightClick: () => void = () => {
  }
  @BuilderParam
  customLabel: () => void // 左侧标题的自定义结构
  @BuilderParam
  customIcon: () => void // 右侧标题的自定义结构

  build() {
    Row() {
      if (this.customLabel) {
        this.customLabel()
      } else {
        Text(this.title)
          .fontSize(16)
          .fontColor($r("app.color.black"))
      }

      Row() {
        Text(this.value)
          .fontColor($r("app.color.gray"))
          .fontSize(14)

        if (this.customIcon) {
          this.customIcon()
        } else {
          if (this.showRightIcon) {
            Image(this.icon)
              .fillColor($r("app.color.gray"))
              .width(30)
              .aspectRatio(1)
              .onClick(() => {
                this.onRightClick()
              })
          }
        }
      }
    }
    .width("100%")
    .constraintSize({
      minHeight: 50
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}