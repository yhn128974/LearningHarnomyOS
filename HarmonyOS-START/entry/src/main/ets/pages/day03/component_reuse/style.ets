// 全局公共自定义样式
@Styles
function fillScreen() {
  .width('100%')
  .border({
    width: 1,
    style: BorderStyle.Solid
  })
  .backgroundColor('#ddd')
  .height(300)
  .padding(10)
  .margin(10)
}

// 特定扩展样式 不能定义子在组件内部
@Extend(Text)
function priceTextStyle() {
  .fontSize(30).fontColor('#F36')
  .fontSize(18)
}

export {
  priceTextStyle, fillScreen
}