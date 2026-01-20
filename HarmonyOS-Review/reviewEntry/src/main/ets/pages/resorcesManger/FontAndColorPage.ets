@Entry
@Component
struct FontAndColorPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text($r('app.string.title')).fontColor($r('app.color.footColor')).fontSize($r('app.float.text_font_size'))
    }
    .height('100%')
    .width('100%')
    .background($r('app.color.mainThemeColor'))
  }
}

