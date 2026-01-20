import { promptAction } from '@kit.ArkUI';

@Styles
//Styles函数不支持传参，只支持通用样式属性和方法(with,height,onclick，。。)
//不支持导出,轻量级封装
function payStyle() {
  .width('100%')
  .height(50)
  .borderRadius(10)
  .backgroundColor('#FF74BC7A')
  .onClick(() => {
    promptAction.openToast({
      message: "wechat is paying..."
    })
  })
}


@Extend(Button)
//可以支持参数转递,复用专有属性与事件
function currenTextStyle(fontSize: number) {
  //支持只有属性
  .fontSize(fontSize)
  .fontColor(Color.White)
  //也支持通用属性
  .margin(10)
  //支持通用事件与特定组件事件
  .onClick(() => {

  })
}

@Entry
@Component
struct StylePage {
  @State message: string = 'Hello World';

  @Styles
  //Styles函数不支持传参，只支持通用样式属性和方法(with,height,onclick，。。)
  //不支持导出,轻量级封装
  //内部的方位优先级大于外面，从内向外找
  payStyl2() {
    .width('100%')
    .height(50)
    .borderRadius(10)
    .backgroundColor('#FFDDBD61')
    .onClick(() => {
      promptAction.openToast({
        message: "wechat is paying..."
      })
    })
  }

  build() {
    RelativeContainer() {
      Column({
        space: 10
      }) {
        Button('微信支付').payStyle().currenTextStyle(35)
        Button('微信支付').payStyl2().currenTextStyle(30)

      }
    }
    .height('100%')
    .width('100%')
    .padding(10)
  }
}

