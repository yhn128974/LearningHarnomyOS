import { PersonModel } from '../model/user'
import { AppStorageV2, PersistenceV2, promptAction, router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Info {
  @Local user: PersonModel = AppStorageV2.connect(PersonModel, 'Alice', () => new PersonModel({
    name: "default",
    age: 0
  }))!
  @Local localUser: PersonModel = PersistenceV2.connect(PersonModel, 'Ben', () => new PersonModel({
    name: "default",
    age: 0
  }))!

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.img'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text(`姓名:${this.user.name}`)
          Text(`年龄：${this.user.age}岁`)
        }

        Column() {

          Text('磁盘数据')


          Row() {

            Text(`姓名:${this.localUser.name}`)
            Text(`年龄：${this.localUser.age}岁`)
          }
        }


        Button('修改信息').onClick((event: ClickEvent) => {
          this.user.name = 'Peter'
          this.user.age++
        })
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')


      Button("退出").onClick(() => {

        AppStorageV2.remove('Alice')
        router.pushUrl({
          url: 'pages/parameterPassing/AppStorage/page/LoginPage'
        })
      })

      Button("到首页").onClick(() => {
        router.replace({
          url: 'pages/parameterPassing/AppStorage/page/homePage'
        })
      })

      Button('保存一个磁盘信息').onClick((event: ClickEvent) => {
        this.localUser.name = 'longYou'
        //这个不会自动更新需要SAVE,没有响应式
        this.localUser.age += 100
        PersistenceV2.save('Ben')
      })

      Button('查看所有的AppStrogeKey').onClick((event: ClickEvent) => {
        promptAction.openToast({
          message: AppStorageV2.keys().toString()
        })

      })


    }
    .width('100%')
    .height('100%')
  }
}