import { Animator } from '@kit.ArkUI';

@Entry
@ComponentV2
struct AnimiationPage {
  @Local message: string = 'Hello World';
  @Local fontSize: number = 20

  build() {
    Column() {
      Text(this.message)
        .id('AnimiationPageHelloWorld')
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        // .animation({
        //   duration: 300
        // })
      Button('to big').onClick(() => {

        // const timer = setInterval(() => {
        //   if (this.fontSize >= 100) {
        //     clearInterval(timer)
        //   } else {
        //     this.fontSize++
        //   }
        // }, 30)



        this.fontSize = 50
      })
      Button('to small').onClick(() => {
        this.fontSize = 10
      })

    }
    .height('100%')
    .width('100%')
  }
}