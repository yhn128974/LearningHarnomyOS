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

interface IUser {
  // 属性 声明
  name: string
  age: number
  // 方法 声明
  sayHi: () => void
}

interface IStyle {
  width: number
}

// 1. 作为类型使用
let user: IUser = {
  name: 'jack',
  age: 18,
  sayHi() {
    console.log('么么哒')
  }
}

function printUser(user: IUser) {
  console.log(user.name + user.age)
}

printUser(user)

// // 2. 类通过关键字 implements 实现接口
// class Box implements IStyle,IUser {
//   width: number = 0
//   name:string = ''
//   age:number=0
//   sayHi(){
//
//   }
// }

export class IUserModel implements IUser {
  name: string = ''
  age: number = 0
  sayHi: () => void

  constructor(model: IUser) {
    this.name = model.name
    this.age = model.age
    this.sayHi = model.sayHi
  }
}

export class IStyleModel implements IStyle {
  width: number = 0

  constructor(model: IStyle) {
    this.width = model.width
  }
}

let user01=new IUserModel({
  name: 'user01_longyou',
  age: 20,
  sayHi: () => {
    console.log('this is a new user')
  }
})

user01.sayHi()


