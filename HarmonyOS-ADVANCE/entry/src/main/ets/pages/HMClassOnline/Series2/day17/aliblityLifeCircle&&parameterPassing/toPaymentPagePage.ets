import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ToPaymentPage_Page {
  @State message: string = '点击下方拉起支付页面';
  @State countNumber: number = 0

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)


        Button('拉起payAbility并传递结果').onClick(() => {
          // 启动另一个ability
          let context = getContext(this) as common.UIAbilityContext; // UIAbilityContext
          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication',
            moduleName: 'entry', // moduleName非必选
            abilityName: 'PayAbility',
            parameters: {
              //   预下单
              "order_id": Date.now()
            }
          };
          // 启动一个Ability
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              // 显式拉起Ability，通过bundleName、abilityName和moduleName可以唯一确定一个Ability
              console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
            }
          });
        })

        Button('拉起payAbility并传递结果，并接收一个返回值').onClick(async () => {
          // 启动另一个ability
          let context = getContext(this) as common.UIAbilityContext; // UIAbilityContext
          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication',
            moduleName: 'entry', // moduleName非必选
            abilityName: 'PayAbility',
            parameters: {
              //   预下单
              "order_id": Date.now()
            }
          };
          // 启动一个Ability为了结果
          const res = await context.startAbilityForResult(want)
          AlertDialog.show({
            message: JSON.stringify(res)
          })

        })

        Text(this.countNumber.toString())

        Button('发起事件中心').onClick((event: ClickEvent) => {
          let context = getContext(this) as common.UIAbilityContext;

          context.eventHub.on('event01', (num1: number, num2: number) => {
            this.countNumber = num1 + num2
            context.eventHub.off('event1');
          })

          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication',
            moduleName: 'entry', // moduleName非必选
            abilityName: 'PayAbility',
          };
          context.startAbility(want)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}