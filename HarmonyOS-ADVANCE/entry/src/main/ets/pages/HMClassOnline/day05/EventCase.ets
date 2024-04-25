import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State TextInputText: string = ""
  @State TextInputTextPassword: string = ""

  login() {
    if (this.TextInputText === 'admin' && this.TextInputTextPassword === "123456") {
      // 需要导包
      promptAction.showToast({ message: `登陆成功` })
    } else {
      promptAction.showToast({ message: `登陆失败` })
      // AlertDialog.show({
      //   message: "登陆失败"
      // })
    }
  }

  getEnable(){
   return this.TextInputText !== "" && this.TextInputTextPassword !== ""
  }

  build() {
    Row() {
      Column({
        space: 10
      }) {
        TextInput({ placeholder: "请输入文字", text: $$this.TextInputText }).onChange((value: string) => {
          console.log(value)
        }).width('100%')

        TextInput({ placeholder: "请输入文字", text: $$this.TextInputTextPassword }).onChange((value: string) => {
          console.log(value)
        }).width('100%').type(InputType.Password).onSubmit(() => {
          this.login()
        })

        Button('登陆').width('100%')
          .enabled(this.getEnable())
          .onClick(() => {
            this.login()
          })
          .onTouch(() => {
            this.login()
          })
      }
      .width('100%')
      .padding({
        left: 20,
        right: 20
      })
    }
    .height('100%')
  }
}

