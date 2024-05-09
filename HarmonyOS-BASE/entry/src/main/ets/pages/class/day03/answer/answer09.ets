@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State IconRouter: Array<string> = ['app.media.weixin', 'app.media.QQ', 'app.media.weibo']

  build() {
    Column() {

      Text('分享给朋友').fontColor('#303030').margin({
        top: 50
      })

      Row() {
        ForEach(this.IconRouter, (item: string) => {
          Column() {
            Image($r(item)).IconStyle().fillColor('#333')
          }.justifyContent(FlexAlign.Center).imageCountStyle()
        })

      }.padding({
        top:20,
        bottom:20,
      }).margin({
        bottom: 20
      }).justifyContent(FlexAlign.SpaceBetween).width(180)

      Image($r('app.media.qrCode')).fillColor('#333').width(180).margin({
        bottom:20
      })

      Text('关注公众号,回复“订阅期刊”').fontSize(14).lineHeight(14).margin({
        bottom:58
      }).fontColor('#303030')


    }.width('100%')
  }

  @Styles
  IconStyle(){
    .width(30)

  }

  @Styles
  imageCountStyle(){
    .width(46).height(46).backgroundColor('#eee').borderRadius(23)
  }
}

