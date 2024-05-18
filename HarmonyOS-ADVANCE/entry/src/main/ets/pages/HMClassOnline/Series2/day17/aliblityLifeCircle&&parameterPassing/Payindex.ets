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

        // 返回结果
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


      //   触发线程事件
        Button('触发线程事件').onClick((event: ClickEvent) => {
          let context = getContext(this) as common.UIAbilityContext;
          context.eventHub.emit('event01',10,20)
        })


      }
      .width('100%')
    }
    .height('100%')
  }
}