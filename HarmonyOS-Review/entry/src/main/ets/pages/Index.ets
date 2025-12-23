import { promptAction, PromptAction } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text("hello harmony")
        .fontSize(50)
        .fontColor(Color.Red)
        .backgroundColor(Color.Gray)
        .width("100%")
        .height(100)

      Button('i am button').onClick(() => {
    
      })
    }
    .width('100%')
    .height('100%')

  }
}