import { promptAction, router } from '@kit.ArkUI'
import { preferences } from '@kit.ArkData';

class Person {
  name: string = 'Alice';
  age: number = 20
}

@Entry
@Component
struct AppStorageCase01 {
  @StorageProp('123')
  mystring:string=''

  @State
  username: string = ""
  @State
  password: string = ""
  @State
  Alice: Person = {
    name: 'Alice',
    age: 30
  }
  aboutToAppear(): void {
    let context= getContext()
  
    let store= preferences.getPreferencesSync(getContext(), { name:'personStore' })

    store.putSync('name','longyou')
    store.flush()
    let myname= store.getSync('name','') as string
    promptAction.showToast({
      message:myname
    })
  }

  login() {




    AppStorage.setOrCreate('userInfo', this.Alice)
    router.pushUrl({
      url: 'pages/HMClassOnline/Series3/day08/AppStorage/Case02'
    })
  }

  build() {
    Row() {
      Column({ space: 20 }) {

        Text(this.mystring)
        // TextInput({ placeholder: '请输入用户名', text: $$this.Alice.name })
        // TextInput({ placeholder: '请输入密码', text: $$this.Alice.age })
        //   .type(InputType.Password)
        Button("登录")
          .width('100%')
          .onClick(() => {
            this.login()
          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}
