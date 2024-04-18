import { User, UserModel } from './models/User'
import { router } from '@kit.ArkUI';

@Entry
@Component
struct AppStorageCasePageB {
  @State message: string = 'Hello World';
  // 修饰符取值
  // @StorageProp('Alice')
  // Alice: UserModel = new UserModel({} as User);

  @StorageLink('Alice')
  Alice: UserModel = new UserModel({} as User);

  // Alice: UserModel = new UserModel({} as User);

  aboutToAppear(): void {
    //   通过AppStorage.get()获取AppStorage中的值
    this.Alice = AppStorage.get("Alice") as UserModel

    // object! object必定存在
    // this.Alice = AppStorage.get("Alice")!
  }

  build() {
    Column() {

      Row() {
        Image(this.Alice.userAvatar).width(100).aspectRatio(1)
      }

      Row() {

        Text(this.Alice.username)
        Text(this.Alice.userage.toString())

      }

      Button('退出登录').onClick((event: ClickEvent) => {
        router.back();
        // AppStorage.set('Alice', new UserModel({} as User)) //清空对象存储
        //
        // AppStorage.setAndLink('Alice',new UserModel({
        //   username: 'Alice',
        //   userpassword: '',
        //   userage: 25,
        //   userAvatar: 'https://tse3-mm.cn.bing.net/th/id/OIP-C.CfCLhfIoCTPkp9yyvFkejQAAAA?w=178&h=199&c=7&r=0&o=5&dpr=1.5&pid=1.7',
        // }))

        this.Alice.userage=25
      })
    }.width('100%').height('100%')
  }
}