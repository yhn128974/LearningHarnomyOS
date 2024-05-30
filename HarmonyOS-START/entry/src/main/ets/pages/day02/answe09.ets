@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
       Image($r('app.media.hos01')).width('100%')
        Text('AI大模型训练').width('100%').lineHeight(40).fontSize(20).fontWeight(900).fontColor('#464646')
        Row(){
          Text('￥240.00/年').fontSize(25).fontColor('#ee2357')
          Text('￥480/年').fontColor('d7d7d7').fontStyle(FontStyle.Italic).decoration({ type:TextDecorationType.LineThrough })
          Text('5折').height(24).width(40).backgroundColor('#F92947').fontColor('##fff').textAlign(TextAlign.Center)
        }.width('100%')
      }
      .width('100%').backgroundColor(Color.White).padding(10)
    }
    .height('100%').width('100%').backgroundColor(Color.Orange)
  }
}

