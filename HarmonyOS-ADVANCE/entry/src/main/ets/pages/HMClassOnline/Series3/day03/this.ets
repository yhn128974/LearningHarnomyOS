import { promptAction } from '@kit.ArkUI'

interface PerSon {
  name: string,
  age: number
}

@Observed
class PersonModel {
  name: string = ''
  age: number = 0

  constructor(newperson: PerSon) {
    this.name = newperson.name
    this.age = newperson.age
  }
}

@Entry
@Component
struct This {
  @State PersonList: PersonModel[] = [new PersonModel({
    name: 'longyou',
    age: 20
  }), new PersonModel({
    name: 'alice',
    age: 18
  })]
  @State message: string = ''

  showChangename(index: number) {
    promptAction.showToast({
      message: this.PersonList[index].name
    })
  }

  build() {
    Column() {

      TextArea({ text: JSON.stringify(this.PersonList) })
      ForEach(this.PersonList, (item: PersonModel, index: number) => {
        TestItem({
          item: item,
          showChangename:()=>{
            this.showChangename(index)
          }
        })
      })

      Text(this.message).height(40)
      Column() {
        Select([{
          value: 'name'
        }, {
          value: 'age'
        }]).value('name').onSelect((index: number, value: string) => {
          this.message = value
        })

      }.height(40)
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct TestItem {
  @ObjectLink
  item: PersonModel

  showChangename:()=>void=()=>{}
  build() {
    Column() {
      Text(this.item.name)
      TextInput({ text: this.item.name }).onChange(()=>{
        this.showChangename()
      })
    }
  }
}