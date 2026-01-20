@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World';

  build() {

    //GRID
    Grid() {

      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
      GirdCom()
    }
    .height(350)
    .width('100%')
    .backgroundColor(Color.Orange)
    .columnsTemplate('1fr 2fr 1fr') //控制列数与比例
    .columnsGap(10)

    // .rowsTemplate('1fr 2fr 1fr') //控制行数与比例
    .rowsGap(10)
  }
}

@Component
struct GirdCom {
  build() {
    GridItem() {
      Column() {
        Image($r('app.media.startIcon')).width(50).height(50)
        Text('HELLO')
      }

    }.border({
      width: 1
    })
  }
}