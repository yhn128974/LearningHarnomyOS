import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World';
  @State phoneNumber: number = 0
  @State Password: string = ''

  handleLogin(): boolean {
    return !!(this.phoneNumber && this.Password)
  }

  build() {

    Column({
      space: 10
    }) {
      Image($r('app.media.suatilogo')).width(90)
      Text('欢迎使用鸿蒙刷题')
      TextInput({
        placeholder: '请输入手机号',
        text: $$this.phoneNumber
      }).type(InputType.PhoneNumber)
      TextInput({
        placeholder: '请输入密码',
        text: $$this.Password
      }).type(InputType.Password)
      Button('登录').onClick((event: ClickEvent) => {

        if (this.phoneNumber==15730594275&&this.Password=='yuhaonan2048') {
          router.pushUrl({
            url: 'pages/ClassOnline/day11/ProvideAndConsumeCase/IndexPage'
          })
        }else {
          promptAction.showToast({
            message: 'phoneNumber of passworld error'
          })
        }

      }).enabled(this.handleLogin()).width('100%')
    }
    .width('100%').height('100%').padding(20)

  }
}