import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Second {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('点击跳转SecondPage').onClick((event: ClickEvent) => {
          try {
            router.showAlertBeforeBackPage({
              message:'Are you ok!'
            })
            router.back()
          }catch(err) {
            let message=(err as BusinessError).message;
            let code=(err as BusinessError).code
            console.log(`code is ${code},message is ${message}`);
          }

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}