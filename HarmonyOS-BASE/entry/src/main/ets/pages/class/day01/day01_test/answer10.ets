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


interface Person {
  chineseName: string,
  foreignName: string,
  alias: string,
  nationality: string,
  native: string,
  dateOfBirth: string,
  dateOfDeath: string,
  height: number | string,
  weight: number | string,
  schoolOfGraduation: string
  getAge: () => number,
  age:number,
}

let kebo: Person = {
  chineseName: '科比.布莱恩特',
  foreignName: 'Kobe Bryant',
  alias: "黑曼巴(Black Mamba),小飞侠",
  nationality: '美国',
  native: '美国宾夕法尼亚州费城',
  dateOfBirth: '1978年',
  dateOfDeath: '2020年',
  height: '198cm',
  weight: '96kg',
  schoolOfGraduation: '劳尔梅里高中',

  getAge: () => {
    let age: number = Number(kebo.dateOfDeath.replace(/\D/g, ''))-Number(kebo.dateOfBirth.replace(/\D/g, ''))
    return age
  },
  age:0
}
// 保存年龄
kebo.age=kebo.getAge()

console.log("别名"+kebo.alias)
console.log("年龄"+kebo.age);