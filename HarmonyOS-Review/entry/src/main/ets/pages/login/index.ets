import { HcNavBar } from "../../commons/components/HcNavBar"
import { promptAction } from "@kit.ArkUI"
import { httpClient } from "../../commons/utils/http/httpClient"
import { LoginParams, User } from "../../models"

@ComponentV2
struct LoginPage {
  @Local mobile: string = 'hmheima'
  @Local code: string = 'Hmheima%123'
  @Local isAgree: boolean = false
  @Local loading: boolean = false

  async login() {
    if (this.loading) {
      return
    }
    if (!this.mobile) {
      return promptAction.showToast({ message: '请输入用户名' })
    }
    if (!this.code) {
      return promptAction.showToast({ message: '请输入密码' })
    }
    if (!this.isAgree) {
      return promptAction.showToast({ message: '请勾选已阅读并同意' })
    }

    try {
      this.loading = true
      const user = await httpClient.request<User, LoginParams>({
        method: 'post',
        url: 'login',
        data: {
          username: this.mobile,
          password: this.code
        }
      })
      this.loading = false
      console.log(JSON.stringify(user))
      //存储token到本地

    } catch (e) {
      this.loading = false
      promptAction.showToast({ message: e.message })
    }
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        HcNavBar({ showRightIcon: false })

        Column() {
          Image($r('app.media.icon'))
            .width(120)
            .aspectRatio(1)
          Text('面试通')
            .fontSize(28)
            .margin({ bottom: 15 })
          Text('搞定企业面试真题，就用面试通')
            .fontSize(14)
            .fontColor($r('app.color.common_gray_01'))
        }
        .padding(16)

        Column({ space: 15 }) {
          TextInput({ placeholder: '请输入用户名', text: $$this.mobile })
            .customStyle()
          TextInput({ placeholder: '请输入密码', text: $$this.code })
            .type(InputType.Password)
            .showPasswordIcon(false)
            .customStyle()
          Row() {
            Checkbox()
              .shape(CheckBoxShape.ROUNDED_SQUARE)
              .selectedColor('#fa711d')
              .size({ width: 14, height: 14 })
              .select(this.isAgree)
              .onChange((val) => {
                this.isAgree = val
              })
            Text('已阅读并同意')
              .fontSize(14)
              .fontColor($r('app.color.common_gray_01'))
              .padding({ right: 4 })
            Text('用户协议')
              .fontSize(14)
              .padding({ right: 4 })
            Text('和')
              .fontSize(14)
              .fontColor($r('app.color.common_gray_01'))
              .padding({ right: 4 })
            Text('隐私政策')
              .fontSize(14)
          }
          .width('100%')

          Button({ type: ButtonType.Normal }) {
            Row() {
              if (this.loading) {
                LoadingProgress()
                  .color($r('app.color.white'))
                  .width(24)
                  .height(24)
                  .margin({ right: 10 })
              }
              Text('立即登录')
                .fontColor($r('app.color.white'))
            }
          }
          .width('100%')
          .backgroundColor('none')
          .borderRadius(4)
          .height(44)
          .linearGradient({
            direction: GradientDirection.Right,
            colors: [['#fc9c1c', 0], ['#fa711d', 1]]
          })
          .stateEffect(false)
          .onClick(() => {
            // TODO
            this.login()
          })
        }
        .padding({ left: 36, right: 36, top: 30 })

        Column() {
          Text('其他登录方式')
            .fontSize(14)
            .fontColor($r('app.color.common_gray_01'))
        }
        .padding({ top: 70, bottom: 100 })

      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Extend(TextInput)
function customStyle() {
  .placeholderColor('#C3C3C5')
  .caretColor('#fa711d')
  .height(44)
  .borderRadius(0)
  .backgroundColor($r('app.color.white'))
  .border({ width: { bottom: 0.5 }, color: $r('app.color.common_gray_border') })
}

// 跳转页面入口函数
@Builder
export function LoginBuilder() {
  LoginPage()
}