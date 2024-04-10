@Entry
@Component
struct BuilderCase {
  @State message: string = 'Hello World';

  @Builder
  getItemBulder() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
  }

  build() {
    Row() {
      this.getItemBulder()
    }
    .height('100%')
  }
}