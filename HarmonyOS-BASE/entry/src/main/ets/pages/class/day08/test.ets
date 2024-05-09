@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

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

let count = 0;
for (let i = 10; i <= 100; i++) {
  if ((i % 2) != 0) {
    count = count + i
  }
}
console.log("" + count);