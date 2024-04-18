interface Person {
  name: string;
  age: number;
  gender: string;

}

class PersonModel implements Person {
  name: string = ''
  age: number = 0
  gender: string = ''

  constructor(model: Person) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
  }
}

let personInfo: Record<string, PersonModel> = {
  'Alice': new PersonModel({
    name: 'ALice',
    age: 20,
    gender: "女"
  }),
  'Ben': new PersonModel({
    name: 'Ben',
    age: 25,
    gender: "男"
  })
}

const localStorage = new LocalStorage(personInfo)

export {
  localStorage, PersonModel,Person
}