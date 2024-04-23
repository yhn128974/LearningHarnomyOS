@Entry({routeName:'pay_index'})
@Component
export  struct Index {
  @State message: string = 'payment page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}