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

function func(name: string = 'jack', ...args: (string | number)[]) {

}

func()

func('rose', 'jack', 666)


interface IPerson {
  name: string,
  age: number,
  friends: string[]
}

class Person {
  name: string
  age: number
  friends: string[]

  constructor(person: IPerson) {
    this.name = person.name
    this.age = person.age
    this.friends = person.friends
  }

  sayHi() {
    console.log(this.name, this.age, this.friends)
  }
}

enum StudentMale {
  Boy = '男孩',
  Girl = '女孩'
}

interface IStudent extends IPerson {}

class Student extends Person {
  male: StudentMale;
  grade: string

  constructor(male: StudentMale, grade: string, person: IStudent) {
    super(person)
    this.male = male;
    this.grade = grade;
  }

  sayHi() {
    super.sayHi()
  }
}

let student1 = new Student(StudentMale.Boy, '优',
  {
    name: 'Alice',
    age: 18,
    friends: ['Ben', 'John']
  });

student1.sayHi()
