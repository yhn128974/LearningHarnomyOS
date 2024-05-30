import Want from '@ohos.app.ability.Want';
import { common, UIAbility } from '@kit.AbilityKit';

@Entry
@Component
struct PayabilityPage {
  @State message: string = 'pay ability';
  @StorageProp('order_id')
  order_id: string = ''
  build() {
    Row() {
      Column() {


        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(this.order_id)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('back').onClick((event: ClickEvent) => {

          let currentwant: Want = {
            'deviceId': '', // deviceId为空表示本设备
            'bundleName': 'com.example.myapplication',
            "moduleName": "entry",
            'abilityName': 'EntryAbility',
            parameters: {}
          }

          let currentContext = getContext() as common.UIAbilityContext
          currentContext.startAbility(currentwant)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}