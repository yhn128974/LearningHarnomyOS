import { router } from '@kit.ArkUI';
import { TokenManager } from '../my_perferences';

@Entry
@Component
struct Home {
  @State message: string = 'HOME PAGE';
  @StorageProp('token') token: string = ''

  build() {
    Row() {
      Column() {
        Text(this.token ? this.token : this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('back').onClick((event: ClickEvent) => {
          router.back({
            url: 'pages/HMClassOnline/day13/preferences/Pages/Login'
          });
        })

        Button('退出登录').onClick((event: ClickEvent) => {
          TokenManager.setToken('')
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}