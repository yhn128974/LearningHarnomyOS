@Entry
@Component
struct Index {
  build() {
    Column() {
      Column() {
        Text('我的年度歌手榜')
          .lineHeight(40)
          .fontSize(14)
          .fontColor('#bdbdbd')
        Text('周杰伦')
          .lineHeight(50)
          .fontSize(24)
          .fontWeight(700)
        Image($r('app.media.zhoujielun'))
          .width(60)
        Text('真爱就是循环一千遍')
          .lineHeight(40)
          .fontSize(14)
          .fontColor('#999')
      }
      .width(200)
      .height(200)
      .backgroundColor('#fff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7f8')
  }
}