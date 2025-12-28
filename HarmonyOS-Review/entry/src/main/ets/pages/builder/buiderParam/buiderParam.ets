@Entry
@Component
struct BuiderParam {
  @State message: string = 'Hello World';

  @Builder
  //Builder是一部普通函数在传递时不需要执行
  leftContent() {
    Image($r('sys.media.ohos_ic_public_arrow_left')).width(20).fillColor(Color.Black).height(20)
  }

  @Builder
  titleContent() {
    Text('I am title of parent')
  }

  build() {
    Column() {
      Header({
        leftOfHead: () => {
          this.leftContent()
        },
        contentOfHead: this.titleContent
      })
      Header()
    }.width('100%').height('100%')
  }
}

@ComponentV2
struct Header {
  //BuilderParam 必须要有一个默认Builder否则容易报错
  @BuilderParam leftOfHead: () => void = this.defaultLeft
  @BuilderParam contentOfHead: () => void = this.defaultTitle

  @Builder
  defaultLeft() {
    Text('返回')
  }

  @Builder
  defaultTitle() {
    Text('默认标题')
  }

  build() {
    Row() {
      this.leftOfHead()
      this.contentOfHead()
      Text('尾部')
    }.width('100%').height(60).padding(10).justifyContent(FlexAlign.SpaceBetween)
  }
}