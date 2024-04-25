import { Car, CarModel } from '../../../../entryability/EntryAbility'
import { router } from '@kit.ArkUI'

// 通过getShared获取
let carInfo_localStorage = LocalStorage.getShared()

@Entry(carInfo_localStorage)
@Component
struct FromEntryAbilityA {
  @LocalStorageLink('BMW')
  BMW: CarModel = new CarModel({} as Car)

  build() {
    Row() {
      Column() {

        Text(this.BMW.engine )
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('点击更换引擎').onClick((event: ClickEvent) => {
          this.BMW.engine='engine'
        })

        Button('to B').onClick((event: ClickEvent) => {
          router.pushUrl({ url:'pages/HMClassOnline/day13/LocalStorageCase/FromEntryAbilityB' })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}