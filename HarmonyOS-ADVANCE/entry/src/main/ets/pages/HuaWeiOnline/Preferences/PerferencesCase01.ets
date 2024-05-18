import { PersonStore } from './store'
import { Person, PersonModel } from './models'


@Entry
@Component
struct Index {

  @State message: string = 'Hello World';
  @State myPersonList: PersonModel[] = [new PersonModel({} as Person)]

  aboutToAppear(): void {
  
    this.getPersonList()
  }

  async getPersonList() {

    let PersonList: PersonModel[] = [new PersonModel({
      name: 'Alice',
      age: 20,
      gender: '女'
    }), new PersonModel({
      name: 'Ben',
      age: 24,
      gender: '男'
    }),
    ]
    // 等待系统操作
    await PersonList.forEach((item: PersonModel) => {
      PersonStore.setStoreItem(item.name, item)
    })


    let newPersonList = await PersonStore.getStoreList()
    let Alice = await PersonStore.getStoreItem('Alice')

    console.log('Alice', JSON.stringify(Alice))
    console.log('newPersonList', JSON.stringify(newPersonList))

    this.myPersonList = newPersonList
  }

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.myPersonList, (item: PersonModel) => {
            ListItem() {
              Row() {
                Text(item.name).fontSize(20).fontWeight(600).fontStyle(FontStyle.Italic)
              }
            }
          })
        }

        Button('delete onePerson').onClick(async (event: ClickEvent) => {
          PersonStore.deleteStoreItem('Alice')
          this.myPersonList = await PersonStore.getStoreList()
        })

        Button('clear PersonStore').onClick(async (event: ClickEvent) => {
          PersonStore.clearStore()
          this.myPersonList = await PersonStore.getStoreList()
        })

        Button('delete PersonStore').onClick(async (event: ClickEvent) => {
          PersonStore.deleteStore()
          this.myPersonList = await PersonStore.getStoreList()
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}

