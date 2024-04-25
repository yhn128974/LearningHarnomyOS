import { promptAction, router } from '@kit.ArkUI';
import {User,UserModel} from './models/User'

@Entry
@Component
struct AppStorageCasePageA {
  @State message: string = 'Hello World';
  @State name: string = ''
  @State password: string = ''

  @State Alice: UserModel = new UserModel({} as User)


  login() {
    if (this.name == 'admin' && this.password == '123456') {
      // 设置AppStorage的值
      AppStorage.setOrCreate<UserModel>('Alice', new UserModel({
        username: this.name,
        userpassword: this.password,
        userage: 20,
        userAvatar: 'https://tse3-mm.cn.bing.net/th/id/OIP-C.CfCLhfIoCTPkp9yyvFkejQAAAA?w=178&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      }));
      this.Alice = AppStorage.get("Alice") as UserModel

      router.pushUrl({
        url: 'pages/HMClassOnline/day13/AppStorageCase/AppStorageCasePageB'
      })
    }else{
      promptAction.showToast({
        message: 'username of password error'
      })
    }
  }
getAliceAge():string|null{
  if (this.Alice.userage) {
    return this.Alice.userage.toString()
  }else{
    return null
  }
}
  build() {
    Column({
      space: 10
    }) {
      TextInput({
        placeholder: '请输入账号', text: $$this.name
      }).width('100%')
      TextInput({
        placeholder: '请输入密码', text: $$this.password
      }).width('100%').type(InputType.Password)
      Button('登陆').onClick((event: ClickEvent) => {
        this.login()
      }).width('100%')

      Text(this.getAliceAge())
    }.padding(10).width('100%').height('100%')
  }
}
