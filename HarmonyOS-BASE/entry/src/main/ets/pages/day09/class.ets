import { Text_test } from './interfaceDEMO'
import { button_style } from './styleDemo'



@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  // private title: Text_test = new Text_test()
  @State title: Text_test = {
    name: '',
    age: 0
  }

  Change_Text_test(): void {
    this.title = {
      name: '标题1',
      age: 0
    }
  }

  aboutToAppear(): void {
    this.Change_Text_test()
  }

  onPageShow(): void {

  }

  onPageHide(): void {

  }

  aboutToDisappear(): void {

  }

  build() {
    Row() {
      Column() {
        Text(this.title.name)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

  @Styles
  box1() {
    .width('100%')
    .height('100%')
  }
}

@Styles
function box2() {
  .width('100%')
  .height('100%')
}




