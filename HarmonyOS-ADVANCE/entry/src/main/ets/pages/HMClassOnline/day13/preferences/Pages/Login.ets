import { router } from '@kit.ArkUI';
import { TokenManager } from '../my_perferences';

PersistentStorage.persistProp('token', '')

@Entry
@Component
struct Login {
  @State message: string = 'LOGIN PAGE';
  @StorageProp('token')
  token: string = ''

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(this.token)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('login').onClick((event: ClickEvent) => {

          let res = AppStorage.set('token', '123456')

          TokenManager.setToken('123456') //写入用户偏好

          if (res) {
            router.pushUrl({ url: 'pages/HMClassOnline/day13/preferences/Pages/Home' })
          }

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}