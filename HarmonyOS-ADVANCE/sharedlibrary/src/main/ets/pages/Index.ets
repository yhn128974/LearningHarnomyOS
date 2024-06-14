import { LibraryLog } from 'staticlibrary';

@Entry({routeName:'hsp-test'})
@Component
export struct IndexPage {
  @State message: string = 'Hello World';
  aboutToAppear(): void {
    LibraryLog

  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}