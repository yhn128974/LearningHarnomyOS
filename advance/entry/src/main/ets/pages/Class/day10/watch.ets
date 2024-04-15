import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @Watch('onActivemessage')
  @State message: string = 'Hello World';

  onActivemessage() {
    promptAction.showToast({ message: 'message被更新了' })
  }

  build() {

    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('changed message').onClick((event: ClickEvent) => {
        this.message = 'message was changed!'
      })


      ChildIndex({
        message: this.message,
      })
    }

  }
}

@Component
struct ChildIndex {
  @Link message: string

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('changed message').onClick((event: ClickEvent) => {
        this.message = 'message was changed!'
      })
    }

  }
}

