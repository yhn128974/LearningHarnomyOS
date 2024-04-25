@Preview
@Component
export struct Hmpanel {

  @Prop panelHeight: number = 300
  @BuilderParam body: () => void
  @Prop color:Color

  build() {

      Column() {
        this.body()
      }.backgroundColor(this.color)
      .width('100%')
      .height(this.panelHeight)
      .borderRadius(20)
      .padding(20)


  }
}