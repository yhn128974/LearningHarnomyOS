@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
      Text("小说简介").textAlign(TextAlign.Start).width('100%')
        .height(40).fontSize(14).fontWeight(FontWeight.Bold)
        Row(){
          Text('都市').backgroundColor(Color.Orange).width(50)
            .height(30)
          Text('生活').backgroundColor(Color.Pink).width(50)
            .height(30)
          Text('感情').backgroundColor(Color.Yellow).width(50)
            .height(30)
          Text('男频').backgroundColor(Color.Gray).width(50)
            .height(30)
        }.width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

