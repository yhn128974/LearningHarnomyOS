import { promptAction } from '@kit.ArkUI'

interface Person {
  name: string,
  age: number,
  gender: string,
}

@Observed
export class PersonModel implements Person {
  name: string = ''
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
struct Class {
  @State HarmonyaOSClass: PersonModel[] = [
    new PersonModel({
      name: 'Alice',
      age: 20,
      gender: "女",
    }),
    new PersonModel({
      name: 'Ben',
      age: 23,
      gender: "男",
    })
  ]

  showClassPersonChange(index: number) {
    promptAction.showToast({
      message: this.HarmonyaOSClass[index].age.toString()
    })
  }

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.HarmonyaOSClass, (item: PersonModel, index: number) => {
            ListItem() {
              Column() {
                PersonItem({
                  person: item,
                  hook_age_change: () => {
                    this.showClassPersonChange(index)
                  }
                })
                Text(this.HarmonyaOSClass[index].age.toString())
              }

            }

          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct PersonItem {
  @ObjectLink person: PersonModel
  hook_age_change: () => void = () => {
  }

  build() {
    Column() {
      Text(`项目:${this.person.name}`).width('100$')
      Row() {
        Button('-').onClick((event: ClickEvent) => {
          this.person.age--
          this.hook_age_change()
        })
        Text(`年龄:${this.person.age}`)
        Button('+').onClick((event: ClickEvent) => {
          this.person.age++
          this.hook_age_change()

        })
      }.width('100$')

      Text(`性别:${this.person.gender}`).width('100$')
    }.width('100$').padding(10)
  }
}


