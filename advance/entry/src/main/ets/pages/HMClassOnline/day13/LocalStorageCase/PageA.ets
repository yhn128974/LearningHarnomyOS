import { router } from '@kit.ArkUI';
// // 通过导入获取
import { localStorage, PersonModel, Person } from './models/commonLocalStorage'

@Entry(localStorage)
  //表示需要共享
@Component
struct PageA {
  @State message: string = 'Page A';
  // Local===this.ability
  @LocalStorageProp('Alice')
  Alice: PersonModel = new PersonModel({} as Person) //必须给初始值，页面加载完毕后不一定能马上拿到localStorage的数据,避免数据UNDIFIND
  @LocalStorageLink('Ben')
  Ben: PersonModel = new PersonModel({} as Person) //必须给初始值

  build() {
    Row() {
      Column() {
        Text(JSON.stringify(this.Alice))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(JSON.stringify(this.Ben))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('点击跳转').onClick((event: ClickEvent) => {
          router.pushUrl({ url: 'pages/HMClassOnline/day13/LocalStorageCase/PageB' })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}