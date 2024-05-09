@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        // Text(this.message)
        //   .fontSize(50)// 设置字体缩进
        //   .textIndent(100)
        //   .fontWeight(FontWeight.Bold)
        //   .fontColor('#FF0000')
        //   .fontColor(Color.Black)
        //   .fontColor('rgba(255,0,0,0.5)')
        //   .fontStyle(FontStyle.Italic)// 行高
        //   .lineHeight(50)// decoration修饰符
        //   .decoration({
        //     type: TextDecorationType.Underline,
        //     color: Color.Black
        //   })
        //
        //   .textAlign(TextAlign.Start)
        //   .width('100%')
        //   .align(Alignment.Bottom)
        //
        // // 设置最大行数
        // Text('阿爸巴巴爸爸吧巴巴爸爸巴巴爸爸').fontSize(50).maxLines(2).textOverflow(
        //   { overflow: TextOverflow.MARQUEE }
        // ).lineHeight(50)
        // Image('https://bbs.itheima.com/template/gfquan/src/logo.png').width('100%')

        Column() {
          // 本地图片 正方形图添加 aspectRatio 属性，宽高比例为 1:1
          Image($r('app.media.cat'))
            .width(200)
            .aspectRatio(0.5)
            .objectFit(ImageFit.Cover)
            .border({
              width:1,
              style:BorderStyle.Solid
            })
          // 网络图片
          Image('https://www.itheima.com/images/logo.png')
            .width(200)// 长方形图片设置宽高比1:1, 会导致图片显示不全
            .aspectRatio(2)
        }

        Image('https://www.itheima.com/images/logo.png')
          .width(200)// 加载时显示的占位图
          .alt($r('app.media.startIcon'))


      }
      .width('100%').justifyContent(FlexAlign.Start)
    }
    .height('100%')
  }
}

