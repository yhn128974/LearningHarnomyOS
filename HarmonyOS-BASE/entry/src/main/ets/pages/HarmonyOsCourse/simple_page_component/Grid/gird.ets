@Entry
@Component
struct GridExample {
  // 定义一个长度为16的数组
  private arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

  build() {
    Column() {
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .fontColor(Color.White)
              .backgroundColor(0x007DFF)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
        })
      }
      // 列数 xfr列比例
      .columnsTemplate('1fr 2fr 1fr ')
      // 单设可以进行滚动展示
      // .rowsTemplate('1fr 2fr 1fr ')
      .columnsGap(10)
      // 行间距
      .rowsGap(20)

      .height(300)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(0xF1F3F5)
  }
}