@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isCompleted: boolean = false

  build() {
    Row() {
      Column() {

        Row() {
          Components01({ isCompleted: this.isCompleted })
        }.onClick(() => {
          this.isCompleted = !this.isCompleted
          console.log("" + this.isCompleted)
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Components01 {
  @Prop isCompleted: boolean;

  build() {
    if (this.isCompleted) {
      Text('hello world!')
        .fontSize(20)
        .fontWeight(800)
    }
    else {
      Text('No completed message!').fontSize(20).fontWeight(800)
    }
  }
}


// let numbertest: string = 'apple'
//
// switch (numbertest) {
//   case '0':
//
//     break
//   case '1':
//
//     break
//   case ' 2':
//
//     break
//
//   case 'apple':
//     console.log('look you are so good!')
//     break
//
//   case '4':
//
//     break
//   default:
//     console.log('不存才');
// }