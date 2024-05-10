interface PersonCard {
  name: string,
  age: number,
  gender: '男' | '女',
  bank: string,
  count: number
}

@Observed
export class PersonCardModel implements PersonCard {
  name: string = ''
  age: number = 0
  gender: '男' | '女' = '男'
  bank: string = ''
  count: number = 0

  constructor(model: PersonCard) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
    this.bank = model.bank
    this.count = model.count
  }
}

@Entry
@Component
struct Index {
  @State Alice: PersonCardModel = new PersonCardModel({
    name: 'Alice',
    age: 20,
    gender: '女',
    bank: '招商银行',
    count: 400000
  })

  build() {
    Row() {
      Column() {
        Row() {
          Text('姓名')
          Text(this.Alice.name)
          TextInput({
            text: this.Alice.name
          }).onChange(value => {
            this.Alice.name = value
          })
        }.width('375lpx').border({
          width:1
        })

        Row() {
          Radio({
            group: '01',
            value: '男'
          })
          Radio({
            group: '01',
            value: '女'
          })

        }

        Row() {
          Checkbox({
            group: 'gender',
            name: '女'
          }).shape(CheckBoxShape.ROUNDED_SQUARE)
          Checkbox({
            group: 'gender',
            name: '男'
          }).shape(CheckBoxShape.ROUNDED_SQUARE)

        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

