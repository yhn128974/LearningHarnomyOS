import { router } from '@kit.ArkUI';

PersistentStorage.persistProp('token', '')

@Entry
@Component
struct Login {
  @State message: string = 'Hello World';
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
          if (res) {
            router.pushUrl({ url: 'pages/HMClassOnline/day13/PersistentStorageCase/Pages/Home' })
          }

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}