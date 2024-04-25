Environment.envProp('colorMode', ColorMode.DARK)

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageLink('colorMode')
  colorMode: ColorMode = ColorMode.LIGHT

  build() {
    Row() {
      Column() {
        Text(`color mode ${this.colorMode === ColorMode.LIGHT ? '浅色' : '深色'}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            this.colorMode=ColorMode.DARK;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

