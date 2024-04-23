import { common, Want } from '@kit.AbilityKit';

@Entry
@Component
struct Payindex {
  @State message: string = 'Payment Page';
  @StorageProp('order_id')
  order_id: number = 0

  build() {
    Row() {
      Column() {
        Text(this.order_id.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('支付').onClick((event: ClickEvent) => {
          let context = getContext() as common.UIAbilityContext

          let want: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication',
            moduleName: 'entry', // moduleName非必选
            abilityName: 'PayAbility',
            parameters: {
              //   预下单
              "pay_result": true
            }
          };

          context.terminateSelfWithResult({
            resultCode: 200,
            want: want
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}