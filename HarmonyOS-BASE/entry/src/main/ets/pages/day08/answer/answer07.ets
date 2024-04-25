import { ArrayList } from '@kit.ArkTS';

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

let arary: Array<number> = [213, 34, 45, 123, 45, 565, 1, 34]
let arary2: Array<number> = []
let arary3: Array<number> = []

for (const item of arary) {
  if (item < 50) {
    arary2.push(item)
  } else {
    arary3.push(item)
  }
}

console.log(""+arary2);
console.log(""+arary3);
