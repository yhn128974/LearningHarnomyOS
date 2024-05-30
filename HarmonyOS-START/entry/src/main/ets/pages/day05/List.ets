import { Axis } from '@ohos.multimodalInput.mouseEvent';

@Entry
@Component
struct Index {
  @State message: string[] = ['Hello World', '001', '002', '003', '004', '005', '006', '007'];

  build() {
    Column() {
      List({
        space: 10
      }) {
        ForEach(this.message, (item: string, index: number) => {
          ListItem() {

            Text(item).linear_gradient_default()

          }.border({
            width: 1,
            style: BorderStyle.Solid
          })
          .height(400)
          .backgroundColor(Color.Pink)
          .width('100%')
        })

      }
      // Item在交叉轴的排列方式
      .alignListItem(ListItemAlign.Start)
      // Item之间的分割线
      .scrollBar(BarState.On)
      //分割线样式
      .divider({
        strokeWidth: 5,
        color: Color.Orange,
        startMargin: 10,
        endMargin: 10
      })
      // 分割ListItem的个数与间距
      .lanes(2, 10)
    }
    .height('100%').width('100%')
  }


}

// 线性渐变
@Extend(Text)
function linear_gradient_default(){
.linearGradient({
  angle:90,
  direction:GradientDirection.Right,
  colors: [['red', 0.1], ['#fc0', 0.8]]
})
}

//

