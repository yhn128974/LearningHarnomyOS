import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown, Color.Red, Color.Orange, Color.Yellow, Color.Green];
  @State thiswindowWith: number = 0
  @State thiswindowHeight: number = 0

  build() {
    Column() {
      GridRow({
        columns: 5,
        direction: GridRowDirection.Row,
        gutter: {
          x: 10,
          y: 20
        }
      }) {
        ForEach(this.bgColors, (item: Color, index?: number | undefined) => {
          GridCol() {
            Row() {
              Text(`${index}`)
            }.width('100%').height('50')
          }.backgroundColor(item)
        })
      }
      Text(this.thiswindowWith.toString())
      Text(this.thiswindowHeight.toString())
    }.onAreaChange((oldValue: Area, newValue: Area) => {
      this.thiswindowWith = newValue.width as number
      this.thiswindowHeight = newValue.height as number

    })
    .width('100%')
    .height('100%')


  }
}

