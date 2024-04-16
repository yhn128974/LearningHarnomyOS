import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct WatchCase {
  @State @Watch('ListenMessageChange') message: string = 'hello world'

  ListenMessageChange() {
    promptAction.showToast({
      message: 'message was changed! from parent! '
    })
  }

  build() {
    Column() {
      Row() {
        Text(this.message)
        Button('change message').onClick((event: ClickEvent) => {
          this.message = 'hi you are so good! '
        })
      }

      Divider()

      WatchChild({
        message: this.message
      })

    }
  }
}

@Component
struct WatchChild {
  @Link @Watch('ListenMessageChange_child')  message: string;

  ListenMessageChange_child() {
    promptAction.showToast({
      message: 'message was changed! from child '
    })
  }

  build() {
    Row() {
      Text(this.message)
      Button('change message').onClick((event: ClickEvent) => {
        this.message = 'hi you are so good! '
      })
    }

  }
}