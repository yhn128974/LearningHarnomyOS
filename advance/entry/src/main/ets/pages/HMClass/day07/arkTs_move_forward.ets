import { cloudSync } from '@kit.CoreFileKit';

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

// 泛型
function identify<T>(arg: T): T {
  return arg
}

console.log(identify<string>('string'))
console.log(identify<boolean>(false) + "")

console.log("" + identify<string[]>(['23', '34', '34']))

// 泛型传入,指定传出
function identify2<T>(arg: T[]): number {
  return arg.length
}

console.log("" + identify2<number>([2434, 3445]))

// 泛型传入数组,泛型传出数组
function identify3<T>(arg: T[]): T[] {
  return arg
}

console.log("" + identify3<number>([2434, 3445]))

// 函数类型
function identity4<Input>(arg: Input): Input {
  return arg
}

let myIdentity: <Input>(arg: Input) => Input = identity4


// 泛型约束
interface ILengthwise {
  length: number;
}

function identity5<T extends ILengthwise>(arr: T) {
  console.log(arr.length.toString())
}

identity5(['1234', '454', '454'])
identity5('454')

// identity5(454) //没有length属性
class Cloth implements ILengthwise {
  length: number = 10;
}

class Trousers {
  length: number = 100;
}

identity5(new Cloth())
identity5(new Trousers())

// 多个泛型参数
function funA<T1, T2>(param1: T1, param2: T2) {
  console.log("" + param1)
  console.log("" + param2)
}


funA<string[], number[]>(['123'], [3434])

// 泛型接口
interface Idfunc<T> {
  id: (id: T) => T
  ids: () => T[]
}

let obj: Idfunc<number> = {
  id: (id: number) => {
    return id
  },
  ids: () => {
    return [1]
  }
}

// 泛型类
class Person <T> {
  id: T;

  constructor(id: T) {
    this.id = id;
  }

  getid(): T {
    return this.id
  }
}

let person: Person<string> = new Person("s001")
console.log(person.getid());

class newPerson {
  name?: string;
  age?: number;
  friend?: string[]
}

// Required类型要求
type RequiredPerson = Required<newPerson>
let p1: RequiredPerson = {
  name: 'jack',
  age: 10,
  friend: ['Alice']
}

// Readonly类型要求
type ReadonlyPerson = Readonly<newPerson>
let p2: ReadonlyPerson = {
  name: 'jack',
  age: 10,
  friend: ['Alice']
}
p1.name = 'Ben'

// p2.name='Person' //Cannot assign to 'name' because it is a read-only property. <ArkTSCheck>


// Record<Keys,Type> 将一种类型的属性映射到另一种类型
class CatInfo {
  age: number = 0;
  breed: string = ''
}

type CatName = 'mimi' | 'xiaohei' | 'momo'
type CatType = Record<CatName, CatInfo>
const cats: CatType = {
  'mimi': {
    age: 10,
    breed: 'mimi'
  },
  'xiaohei': {
    age: 10,
    breed: 'xiaohei'
  },
  'momo': {
    age: 10,
    breed: 'momo'
  }
}

// 联合类型设置为空
// let x:number=null; //报错

let x: number | null = null; //可以

// 非空判断
if (x != null) {

}
// 非空断言
let y: number
// y = x + 1; //报错 'x' is possibly 'null'. <ArkTSCheck>

y = x! + 1; //可以 告诉编译器我这个x必不为空


// 空值合并运算符
class Person02 {
  name: string | null = null;

  getName(): string {
    // return this.name!=null ? this.name:''
    return this.name ?? ''
  }
}

class Person05 {
  static name01: string = 'alice'
  static age: number = 20
}

let p5 = new Person05()
Person05.name01

// p5.name01 //不可以通过实例化对象访问静态属性


class Person06 {
  name: string
  age: number

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  getname() {
    console.log(this.name)
  }
}

class Person07 extends Person06 {
  address: string

  constructor(name: string, age: number, address: string) {
    super(name, age)
    this.address = address
  }

  getname() {
    super.getname()
  }


}
let p7=new Person07('Jack',30,'NEWYORK')
console.log(p7.name)










