@Entry
@Component
struct BuilderParamCase {
  @State message: string = 'Hi this message from parent!'

  @Builder
  toChildrenBuilder() {
    Text(this.message)
  }

  @Builder
  toChildrenBuilder2() {
    Image($r('app.media.3')).layoutWeight(1)
  }

  changeMessage() {
    this.message = 'message changed'
  }

  build() {
    Column({
      space: 10
    }) {
      HmCard()

      HmCard({
        a: this.toChildrenBuilder,
        ChangeParentMessage:()=>{
          this.changeMessage()
        }
      })


      HmCard({
        a: this.toChildrenBuilder2,

      })
      HmCard({
        a: () => {
          this.toChildrenBuilder()
        }



      })

      Button('changeMessage').onClick((event: ClickEvent) => {
        this.changeMessage()
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.Center)
    .padding(10)
  }
}

@Component
struct HmCard {
  @State message: string = 'Hi this message from children!'

  ChangeParentMessage:()=>void=()=>{}

  @Builder
  getDefaultContent() {
    Text('there is a default text')
    Button('changeMessage').onClick((event: ClickEvent) => {
      this.message = 'message changed'
    })
  }

  // 从父组件接收不同的UI结构
  @BuilderParam
  a: () => void = this.getDefaultContent

  build() {
    Column() {
      this.a()
    }
    .height(100)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

