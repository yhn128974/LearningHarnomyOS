@Entry
@ComponentV2
struct BiDirectionalPage {
  @Local message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Text(`${this.message}`)
      }

      Divider().height(10)
      Child({
        message: this.message!!
      })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct Child {
  @Param message: string = ''
  @Event $message: (message: string) => void = (mesasge: string) => {
  }

  build() {

    Column() {
      TextInput({
        text: this.message
      }).onChange((value) => {
        this.$message(value)
      })
      Text(this.message)

    }
  }
}