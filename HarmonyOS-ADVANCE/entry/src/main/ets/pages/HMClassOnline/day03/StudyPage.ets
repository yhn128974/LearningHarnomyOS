@Entry
@Component
struct StudyPage {
  @State message: string = 'Hello World';

  build() {
    // 唯一组件
    Row() {
      Column() {
        Demo()
      }
      .width('100%')
    }
    .height('100%')


  }
}


@Component
  // @CustomDialog
struct Demo {
  build() {
   Text('hello world!')
  }
}

