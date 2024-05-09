interface Info {
  url: string,
  title: string;
  bgurl: string;
}

@Entry
@Component
struct Index {
  @State information: Info[] = [{
    url: 'app.media.img01',
    title: "黑马程序员20天鸿蒙基础从入门到精通视频教程",
    bgurl: 'app.media.bg01'
  }, {
    url: 'app.media.img02',
    title: "鸿蒙入门到起飞，含多所大学练习题+力扣算法题+大厂鸿蒙面试题",
    bgurl: 'app.media.bg02'
  }, {
    url: 'app.media.img01',
    title: "2024新版鸿蒙零基础快速入门",
    bgurl: 'app.media.bg01'
  }]

  build() {
    Column() {
      Column() {
        // 标题
        Text('课程视频（0基础学习，任选一套即可）').TitleStyle()
        // 内容1
        ForEach(this.information, (item: Info, index: number) => {
          Row() {
            Image($r(item.url)).width(45)
            Row() {Text(`${index + 1}. ${item.title}`).TextStyle()}.ROW2()
          }
          .backgroundImage($r(item.bgurl))
          .Row1()
        })
      }
      .Column2()
    }.Column1()
  }

  @Styles
  Column1(){
    .width('100%')
    .padding(20)

  }

  @Styles
  Column2(){
    .width('100%')
    .backgroundColor('#eef4ff')
    .borderRadius(10)

    .padding({
      bottom: 10
    })
  }

  @Styles
  Row1(){
    .padding(15)
    .borderRadius(10)
    .backgroundImageSize(ImageSize.Cover)
    .margin(10)
  }

  @Styles
  ROW2(){
    .layoutWeight(1).margin({
      left: 10,
      right: 10
    })
    .margin({
      left: 10,
      right: 10
    })
    .layoutWeight(1)
  }
}
@Extend(Text)
function TextStyle() {
  .fontSize(14)
  .fontColor('#fff')
  .fontWeight(700)
  .lineHeight(22)
}
@Extend(Text)
function TitleStyle() {
  .fontColor('#333')
  .fontWeight(900)
  .padding({
    top: 20,
  })
}


