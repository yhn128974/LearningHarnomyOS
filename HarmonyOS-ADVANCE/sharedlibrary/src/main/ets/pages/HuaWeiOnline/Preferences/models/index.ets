export  interface Person {
  name: string,
  age: number,
  gender: '男' | "女",
}
export class PersonModel implements Person {
  name: string = ''
  age: number = 0
  gender: '男' | "女" = '男'

  constructor(model: Person) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
  }
}


