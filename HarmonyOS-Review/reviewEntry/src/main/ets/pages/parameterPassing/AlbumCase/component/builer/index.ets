@Builder
export function SelectImageIcon() {
  Row() {
    Image($r('sys.media.ohos_ic_public_add'))
      .width('100%')
      .height('100%')
      .fillColor(Color.Gray)
  }
  .width('100%')
  .height('100%')
  .padding(20)
  .backgroundColor('#f5f7f8')
  .border({
    width: 1,
    color: Color.Gray,
    style: BorderStyle.Dashed
  })
}