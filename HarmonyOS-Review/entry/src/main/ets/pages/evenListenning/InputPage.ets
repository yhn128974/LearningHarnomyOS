import { promptAction } from '@kit.ArkUI';

@Entry
@ComponentV2
struct InputPage {
  @Local message: string = 'Hello World';
  @Local username: string = '';
  @Local password: string = ''
  @Local currentNumber: number = 100;
  @Local flag: boolean = false;
  @Local friends: string[] = ['刘备', '张飞', '关羽']

  build() {
    RelativeContainer() {
      Column() {
        Column() {
          TextInput({
            placeholder: "please input username"
          }).onChange((value: string) => {
            //轻量级的提示
            promptAction.openToast({
              message: value
            })


            //弹层级别提示
            // promptAction.showDialog({
            //   message: 'showDialog'
            // })
          })

          Button('click to loginIn ').onClick((event: ClickEvent) => {
            promptAction.showDialog({
              message: 'hello'
            })
          }).width('100%')
        }

        Column() {
          Text(this.message)
          Text(this.currentNumber.toString())
          Text(this.flag.toString())
          Text(this.friends.toString())
          Button('click to change data').onClick((event: ClickEvent) => {
            // this.message += 'JAVA'
            this.currentNumber++;
            // this.flag = !this.flag
            // this.friends.push('赵云')
          })
        }

        Column() {
          TextInput({
            placeholder: 'please input username', text: this.username
          }).onChange((value: string) => {
            this.username = value
          }).width('100%')

          TextInput({
            placeholder: "please input password", text: this.password
          }).onChange((value: string) => {
            this.password = value
          }).type(InputType.Password).width('100%')

          Button('click to login').onClick((event: ClickEvent) => {
            if (this.username == 'admin' && this.password == '123456') {
              promptAction.openToast({
                message: '登录成功'
              })
              this.username = ''
              this.password = ''
            } else {
              promptAction.openToast({
                message: '账号密码错误'
              })
            }
          })
        }
      }

    }
    .height('100%')
    .width('100%')
  }
}