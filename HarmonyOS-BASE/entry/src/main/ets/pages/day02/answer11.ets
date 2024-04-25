@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Column() {
      // 内容区域
      Column() {
        // 标题
        Text('悟道·元宇宙弄潮者')
          .fontSize(18)
          .fontColor('#111118')
          .height(50)
          .fontWeight(900)
        // 内容
        Text('终于和大家见面了！在第六期中，我们开设了“T前线”精选，特邀重磅嘉宾送上新鲜出炉的独家观点：Java大神李三红就Java版本升级为企业和开发者分别提出了建议；来自腾讯互娱的曹文升从专项测试的角度讲述了游戏产品的打磨故事等等。开发领域，DevOps 似乎已违背初衷，不再是昔日模样。如何直面这一现实，推陈出新？操作系统领域，华为终于正式发布重大版本，这次能否破了安卓圈？答案尽在本期！')
          .fontSize(14)
          .fontColor('#333')
          .maxLines(6)
          .textOverflow({
            overflow:TextOverflow.Ellipsis
          })
          .textIndent(28)

        // 下载
        Row(){
          Text('下载')
            .width(45)
            .fontSize(14)
            .fontColor('#333')
          Button('PDF下载')
            .backgroundColor('#ef4d4d')
            .fontSize(14)
            .width(128)
            .height(30)
            .fontSize(14)
        }.height(60)


      }
      .padding(20)
      .width('100%')
      .backgroundColor('#fff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f8f8f8')
  }
}

