interface Adresses {
  province: string,
  city: string,
  town: string
}

interface userPserons {
  userName: string
  userAge: number
  userGender: '男' | '女'
  userAdress: Adresses
}

@Observed
class AdressesInfo implements Adresses {
  province: string
  city: string
  town: string

  constructor(province: string, city: string, town: string) {
    this.province = province
    this.city = city
    this.town = town
  }
}

@Observed
class userPseronsINformations implements userPserons {
  userName: string
  userAge: number
  userGender: '男' | '女'
  userAdress: AdressesInfo

  constructor(userName: string, userAge: number, userGender: '男' | '女', userAdress: AdressesInfo) {
    this.userAdress = userAdress
    this.userName = userName
    this.userAge = userAge
    this.userGender = userGender
  }
}


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State AliceAddress: AdressesInfo = new AdressesInfo('广东', '广州', '深圳')
  @State Alice: userPseronsINformations = new userPseronsINformations(
    'Alice',
    20,
    '女',
    this.AliceAddress
  )

  build() {
    Row() {
      Column({
        space: 10
      }) {
        Row() {
          Text('姓名').margin({
            right: 10
          })
          TextInput({ placeholder: "请输入姓名", text: this.Alice.userName }).layoutWeight(1)
        }.width('100%').padding(10)

        Row() {
          Text('年龄').margin({
            right: 10
          })
          TextInput({ placeholder: "请输入年龄", text: this.Alice.userAge.toString() }).layoutWeight(1)
        }.width('100%').padding(10)

        Row() {
          Text('性别').margin({
            right: 10
          })
          Select([{ value: "男" }, { value: '女' }]).layoutWeight(1).value(this.Alice.userGender.toString())
        }.width('100%').padding(10)

        Row({
          space: 10
        }) {
          Text('地址').margin({
            right: 10
          })
          TextInput({ placeholder: "省份", text: this.Alice.userAdress.province }).layoutWeight(1)
          TextInput({ placeholder: "市区", text: this.Alice.userAdress.city }).layoutWeight(1)
          TextInput({ placeholder: "乡镇", text: this.Alice.userAdress.town }).layoutWeight(1)

        }.width('100%').padding(10)


        Row() {
          Button('修改姓名').onClick((event: ClickEvent) => {
            this.Alice.userName = 'Ben'
          })

          Button('修改年龄').onClick((event: ClickEvent) => {
            this.Alice.userAge++
          })

          Button('修改性别').onClick((event: ClickEvent) => {
            this.Alice.userGender = this.Alice.userGender === '男' ? '女' : '男'
          })
        }

        Row() {
          Button('修改地区').onClick((event: ClickEvent) => {
            this.Alice.userAdress.province = '上海'
            // let newAdressInfo:Array<string> = Array.from(this.Alice.userAdress)
            //
            // this.Alice.userAdress= new AdressesInfo( this.Alice.userAdress)
          })

          Button('修改地区').onClick((event: ClickEvent) => {
            this.Alice.userAdress.city = '浦东'
          })

          Button('修改地区').onClick((event: ClickEvent) => {
            this.Alice.userAdress.town = '川沙'
          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

