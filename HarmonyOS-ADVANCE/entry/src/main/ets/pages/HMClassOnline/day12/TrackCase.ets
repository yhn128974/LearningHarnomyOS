interface Person {
  name: string;
  age: number,
  gender: string;
}

export class PersonModel implements Person {
  @Track
  name: string = ''
  @Track
  age: number = 0
  gender: string = ''

  constructor(model: Person) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State Alice: PersonModel = new PersonModel({

    name: 'Alice',
    age: 20,
    gender: '女'
  })

  build() {
    Row() {
      Column() {
        Text(this.Alice.name)
        Text(this.Alice.age.toString())

        // 不显示因为没有被Track修饰符修饰,而其他属性被Track修饰了
        Text(this.Alice.gender)
      }
      .width('100%')
    }
    .height('100%')
  }
}

