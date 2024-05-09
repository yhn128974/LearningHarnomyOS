@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.advertising')).width(30).margin({
            right: 15
          })
          Text('广告投放').fontColor(Color.White).fontSize(16).lineHeight(16)
        }

        Image($r('app.media.ic_public_arrow_right')).width(20).fillColor(Color.White)


      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(64)
      .padding({
        left: 16,
        right: 16
      })
      .backgroundImage($r('app.media.adver_bg'))
      .backgroundImageSize(ImageSize.Cover)

      Row() {
        Text('广告投放卡片-综合实战作业目标：制作开发中常见的新闻简介区域能够选择合适的组件搭建界面结能够使用padding、margin等属性调整内容之间的间距能够使用背景属性、边框属性等美化界面效果').fontColor('#5a5b5f')
      }.padding(16).width('100%').backgroundColor('#e6e5ea')
    }.width(268).height(300)
  }
}

