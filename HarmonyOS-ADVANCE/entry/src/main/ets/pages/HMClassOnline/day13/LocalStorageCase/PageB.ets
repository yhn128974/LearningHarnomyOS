import { router } from '@kit.ArkUI';
import { localStorage, PersonModel, Person } from './models/commonLocalStorage'

@Entry(localStorage)
@Component
struct PageB {
  @State message: string = 'Page B';
  @LocalStorageProp('Alice')
  Alice: PersonModel = new PersonModel({} as Person)
  @LocalStorageLink('Ben')
  Ben: PersonModel = new PersonModel({} as Person)

  build() {
    Row() {
      Column() {
        Text(JSON.stringify(this.Alice))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(JSON.stringify(this.Ben))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('增加Alice的年龄').onClick((event: ClickEvent) => {
          this.Alice.age++
        })
        Button('增加Ben的年龄').onClick((event: ClickEvent) => {
          this.Ben.age++
        })


        Button('返回').onClick((event: ClickEvent) => {
          router.back({
            url: 'pages/HMClassOnline/day13/LocalStorageCase/PageA'
          });

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}