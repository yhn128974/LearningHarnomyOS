export interface Person {
  name: string;
  age: number;
  gender: string | number

}

export class PersonModel implements Person {
  name: string = ''
  age: number = 0
  gender: string | number = ''

  constructor(model: Person) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
  }
}


