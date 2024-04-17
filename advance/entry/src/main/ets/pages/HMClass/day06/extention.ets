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

function sum(theArgs:number[]) {
  let total = 0;
  for (const arg of theArgs) {
    total += arg;
  }
  return total;
}

console.log(sum([1, 2, 3]).toString()) // 6

console.log(sum([1, 2, 3, 4]).toString()) // 10

const numArr1: number[] = [1, 2, 3, 4]
const numArr2: number[] = [5, 6, 7]

// 合并到一起
const totalArr: number[] = [...numArr1, ...numArr2]
console.log(""+totalArr);


