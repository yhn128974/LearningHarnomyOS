import { router } from '@kit.ArkUI';

@Entry
@Component
struct Home {
  @State message: string = 'Hello World';
  @StorageProp('token') token: string = ''

  build() {
    Row() {
      Column() {
        Text(this.token ? this.token : this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('back').onClick((event: ClickEvent) => {
          router.back();
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}