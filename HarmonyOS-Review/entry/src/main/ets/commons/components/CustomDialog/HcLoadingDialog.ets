@CustomDialog
export struct HcLoadingDialog {
  controller: CustomDialogController
  message: string = '加载中...'

  build() {

    Column({ space: 10 }) {
      LoadingProgress()
        .width(48)
        .height(48)
        .color($r('app.color.white'))
      if (this.message) {
        Text(this.message)
          .fontSize(14)
          .fontColor($r('app.color.white'))
      }
    }
    .justifyContent(FlexAlign.Center)
    .width(120)
    .height(120)
    .backgroundColor('rgba(0,0,0,0.6)')
    .borderRadius(16)
  }
}