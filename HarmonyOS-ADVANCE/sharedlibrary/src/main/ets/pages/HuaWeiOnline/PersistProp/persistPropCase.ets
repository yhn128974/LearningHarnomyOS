import { Person, PersonModel } from './models'

let Alice = new PersonModel({
  name: 'Alice',
  age: 20,
  gender: '女'
})
PersistentStorage.persistProp('Alice', Alice)

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @StorageLink('Alice') Alice: PersonModel = new PersonModel({} as Person)

  build() {
    Column() {
      Row() {
        Text(this.Alice.name)
        Text(this.Alice.age.toString())
      }

      Button('age++').onClick((event: ClickEvent) => {
        this.Alice.age++
      })
      Divider()
      Children()
    }
  }
}

@Component
struct Children {
  @StorageLink('Alice') Alice: PersonModel = new PersonModel({} as Person)

  build() {
    Column() {
      Row() {
        Text(this.Alice.name)
        Text(this.Alice.age.toString())
      }

      Button('age++').onClick((event: ClickEvent) => {
        this.Alice.age++
      })
    }
  }
}