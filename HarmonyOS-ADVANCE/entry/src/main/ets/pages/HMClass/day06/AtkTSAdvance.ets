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

// typeof 类型判断
// console.log(typeof '123')
// class Person {
//   name: string = 'jack'
// }
// // 对象 数组 null 获取到的都是 object
// const p: Person = new Person()
// console.log(typeof null) // object
// console.log(typeof [1, 2, 3]) // object
// console.log(typeof p) // object
// // 前面 5 个可以正常获取到类型
// console.log(typeof 123) // number
// console.log(typeof '123') // string
// console.log(typeof false) // boolean
// console.log(typeof undefined) // undefined
//
//
// function func() {
// }
//
// console.log(typeof func) // function

// instanceof 运算符可以用来检测某个对象是否是某个类的实例
// let isArr: boolean = [1, 2, 3] instanceof Array;
// console.log("是否为数组" + isArr) //
//
//
// class Person {
//   name: string = 'jack'
// }
//
// class Person2 {
//   name: string = 'jack'
// }
//
// let isPerson: boolean = new Person2() instanceof Person
//
// // console.log('isPerson:', isPerson + '')
//
// // 根据类型选择函数操作
// class Foo {
//   foo: string = ''
//   common: string = ''
//
//   constructor(foo: string, common: string) {
//     this.foo = foo
//     this.common = common
//   }
// }
//
// class Bar {
//   bar: string = '';
//   common: string = ''
//
//   constructor(bar: string, common: string) {
//     this.bar = bar
//     this.common = common
//   }
// }
//
// // 类型别名
// type BarOrFoo = Bar | Foo
//
// function doStuff(arg: BarOrFoo) {
//   if (arg instanceof Foo) {
//     console.log(arg.foo)
//   } else if (arg instanceof Bar) {
//     console.log(arg.common)
//   }
// }

// doStuff(new Bar('there is foo information', 'common information'))

// 静态方法，静态属性
// class Person1 {
//   static staticField: string = '静态字段'
//
//   static staticMethod() {
//     console.log('静态方法')
//   }
// }
//
// console.log("" + Person1.staticField)
// Person1.staticMethod()


// // 私有属性 只有类自身的方法与实例才能访问
// class Person {
//   // private 设置的时候不嫩省略
//   private name: string = ''
//   private age: number = 0
//
//   // 在公共方法内部访问私有变量
//   public sayHi() {
//     // 内部可以访问
//     console.log(`你好，我叫:${this.name}`)
//   }
// }
//
// class Student extends Person {
//   public sayHello() {
//     // 内部可以访问
//     // console.log(`你好，我叫:${super.name}`) // 无法访问 报错
//   }
// }
//
// const p = new Person()
// // p.name // 无法访问 报错
// p.sayHi()


// protect 受保护
class Person {

  protected name: string = 'longyou'
  private age: number = 18

  sayHi(): void {
    console.log(this.name)
    console.log(this.age + '')
  }
}

class Student extends Person {
  sayHello() {
    console.log(this.name) // 可以访问
    // console.log(this.age+'') // 无法访问 报错
  }
}

let p = new Student();
p.sayHello()






