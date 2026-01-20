import { AppStorageV2, router } from '@kit.ArkUI'
import { PersonModel } from '../model/user'


@Entry
@ComponentV2
struct LoginPage {
  pathStack: NavPathStack = new NavPathStack();
  @Local
  username: string = ""
  @Local
  password: string = ""

  aboutToAppear(): void {


  }

  build() {
    Navigation(this.pathStack) {
      Row() {
        Column({ space: 20 }) {
          TextInput({ placeholder: '请输入用户名', text: $$this.username })
          TextInput({ placeholder: '请输入密码', text: $$this.password })
            .type(InputType.Password)
          Button("登录")
            .width('100%')
            .onClick(() => {
              //建立获取得到一个内存存储,不会重复创建
              AppStorageV2.connect(PersonModel, 'Alice', () => new PersonModel({
                name: this.username,
                age: 20
              }))

              router.pushUrl({
                url: "pages/parameterPassing/AppStorage/page/InfoPage"
              })

            })
        }
        .padding(20)
        .width('100%')
      }
      .height('100%')
    }.mode(NavigationMode.Stack)

  }
}