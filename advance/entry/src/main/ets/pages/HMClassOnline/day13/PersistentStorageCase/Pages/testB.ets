import { router } from '@kit.ArkUI';
import { ArrayNumber, ArrayNumberModel } from '../models/index'
// 这个声明必须在UIpage页面内 否则无法调用 无法读取数据


@Entry
@Component
struct Index {

  @StorageLink('text')
  text: ArrayNumberModel = new ArrayNumberModel({} as ArrayNumber)

  build() {
    Row() {
      Column() {
        Text(this.text.b)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('点击跳转').onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/HMClassOnline/day13/PersistentStorageCase/Pages/testA'
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}

