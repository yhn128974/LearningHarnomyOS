import router from '@ohos.router'
import { ArrayNumber, ArrayNumberModel } from '../models/index'
import { promptAction } from '@kit.ArkUI'

PersistentStorage.persistProp('text', '') //写入磁盘
PersistentStorage.persistProp('name', 'longyou') //写入磁盘

@Entry
@Component
struct Index {
  @StorageLink('name')
  name: string = ''

  build() {
    Row() {
      Column() {
        TextInput({
          text: $$this.name
        })
        Text(this.name)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('点击跳转').onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/HMClassOnline/day13/PersistentStorageCase/Pages/testB'
          })
        })

        Button('设置name').onClick((event: ClickEvent) => {
          let res1 = AppStorage.set('name', 'ethanyu')

          let res2 = AppStorage.set<ArrayNumberModel>('text', new ArrayNumberModel({
            a: '123',
            b: '456',
            c: '789'
          }))

          if (res1 && res2) {
            promptAction.showToast({
              message: 'writing successful'
            })
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

