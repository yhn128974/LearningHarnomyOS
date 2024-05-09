@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button($r('app.string.login_text'), { type: ButtonType.Capsule })
          .onClick((event: ClickEvent) => {

          })
          .width($r('app.float.button_width'))
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.login_font_size'))
          .backgroundColor($r('app.color.button_color'))
      }
      .width('100%')
    }
    .height('100%')
  }
}

