import Want from '@ohos.app.ability.Want';
import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct EntryabilityPage {
  @State message: string = 'to payPage';

  build() {
    Row() {
      Column() {

        Button('common router')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/HMClassOnline/Series3/day12/abilityRouter/payabilityPage'
            })
          })


        Button('by want')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let currentWant: Want = {
              'deviceId': '', // deviceId为空表示本设备
              'bundleName': 'com.example.myapplication',
              "moduleName": "entry",
              'abilityName': 'PayAbility',
              parameters: {
                order_id: util.generateRandomUUID()
              }
            }
            let context = getContext() as common.UIAbilityContext
            context.startAbility(currentWant)


          })

        Button('to other app')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let currentWant: Want = {
              'deviceId': '', // deviceId为空表示本设备
              'bundleName': 'com.example.hourtoreach',
              "moduleName": "phone",
              'abilityName': 'EntryAbility',
            }
            let context = getContext() as common.UIAbilityContext
            context.startAbility(currentWant)

          })

      }
      .width('100%')
    }
    .height('100%')
  }
}