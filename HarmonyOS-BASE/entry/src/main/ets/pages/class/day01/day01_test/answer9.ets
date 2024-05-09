




@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
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

// 现有三个尺寸大中小需要进行保存
enum sizes {
  size_1='300cm * 350cm',
  size_2='200cm * 249cm',
  size_3='100cm * 150cm'
}
console.log(sizes.size_2)


