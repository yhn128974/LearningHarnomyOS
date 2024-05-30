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

let array: Array<number> = [1, 2, 3, 4, 5,]
array.splice(0, 1, 10)

console.log("" + array)
array.push(100)
console.log("" + array)
//
array.unshift(999)
console.log("" + array)
// delete start
array.shift()
console.log("" + array)
// delete end
array.pop()
console.log("" + array);

console.log('0'||'1');




