import { router } from '@kit.ArkUI';

interface Person {
  name: string,
  age: number
}

class PersonModel {
  name: string = ''
  age: number = 0

  constructor(person: Person) {
    this.name = person.name;
    this.age = person.age
  }
}

@Entry
@Component
struct FromPageB {
  @State message: string = 'Page B';
  @State LonYou: PersonModel = new PersonModel({} as Person)

  aboutToAppear(): void {
    if (router.getParams()) {
      this.LonYou = router.getParams() as PersonModel
    }

  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('to page A by push').onClick(() => {
          router.pushUrl({
            url: 'pages/HMClassOnline/day17/RouterCase/FromPageA', params: {
              text: "this message from page B"
            }
          }, router.RouterMode.Single)
        })
        Button('to page A by replace').onClick(() => {
          router.pushUrl({ url: 'pages/HMClassOnline/day17/RouterCase/FromPageA' })
        })
        Button('back to A').onClick((event: ClickEvent) => {
          // 注册一个检测事项
          router.showAlertBeforeBackPage({
            message:'Are You sure?'
          })
          router.back()
        })
        Button('clear router Array').onClick(() => {
          router.clear()
        })

        Row() {
          Text(this.LonYou.name ?? 'waitting')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}