@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {

        //Flex佈局不能重疊
        Column() {
          Flex({
            // 方向
            direction: FlexDirection.Column,
            // 主軸的排列方式
            justifyContent: FlexAlign.SpaceAround,
            //交叉軸對齊方式
            alignItems: ItemAlign.Start
            //布局换行
            // wrap: FlexWrap.Wrap
          }) {
            ForEach([1, 2, 3, 4, 5], (item: number, index: number) => {
              this.box(item, 30, 50)
            })
          }

        }.ColumnStyle()
        Column() {
          Flex({
            // 方向
            direction: FlexDirection.Row,
            // 主軸的排列方式
            justifyContent: FlexAlign.SpaceAround,
            //交叉軸對齊方式
            alignItems: ItemAlign.Start
            //布局换行
            // wrap: FlexWrap.Wrap
          }) {
            ForEach([1, 2, 3, 4, 5], (item: number, index: number) => {
              this.box(item, 50, 30)
            })
          }
        }.ColumnStyle()

      }
      .width('100%')
    }
    .height('100%')
  }

  @Builder
  box(item: number, width: number, height: number) {
    Text(`${item}`)
      .width(width)
      .height(height)
      .backgroundColor(Color.Orange)
      .border({
        width: 1,
        style: BorderStyle.Solid
      })
      .textAlign(TextAlign.Center)
    // .alignSelf(ItemAlign.Stretch)
    // .alignSelf(ItemAlign.Start)
  }

  @Styles
  ColumnStyle() {
    .width('100%')
    .height('50%')
    .border({ width: 1, style: BorderStyle.Solid })
    .margin(10)
  }
}




