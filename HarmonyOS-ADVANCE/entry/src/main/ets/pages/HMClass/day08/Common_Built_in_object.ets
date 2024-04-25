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

const numA = 1.5;
//Math.ceil(num)向上取整
console.log(Math.ceil(numA) + '');
//Math.floor向下取整
console.log(Math.floor(numA) + '')

const numList: number [] = [1, 2, 3, 4, 5, 6]
// Math.max返回最大值
console.log("" + Math.max(...numList));
console.log("" + Math.min(...numList));

// Math.random()返回0-1的随机数

// Date 对象
const date: Date = new Date();
console.log(date.getFullYear() + "")
console.log(date.getMonth() + "")
console.log(date.getDate() + "")
console.log(date.getHours() + "")
console.log(date.getMinutes() + "")
console.log(date.getSeconds() + "")

// 获取时间戳
console.log(Date.now() + "")





