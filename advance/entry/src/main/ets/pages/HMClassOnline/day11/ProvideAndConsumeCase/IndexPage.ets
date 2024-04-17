import { UserInfo, UserInfoModel } from './models'

@Entry
@Component
struct IndexPage {
  @State message: string = 'Hello World';
  @Provide user: UserInfoModel = new UserInfoModel({} as UserInfo);

  aboutToAppear(): void {
    this.getCurrentUser()
  }

  async getCurrentUser() {
    const result = await new Promise<UserInfo>(resolve => {
      setTimeout(() => {
        resolve({
          id: 1,
          avatar: 'sd',
          phone: 15730594275,
          passWord: 'yuhaonan2048',
          email: '123@qq.com',
          nickName: 'longyou'
        })
      }, 1000);
    })

    this.user = new UserInfoModel(result)

  }

  build() {
    Tabs() {
      TabContent(){avatar()}.tabBar('微信')
      TabContent(){phone()}.tabBar('联系人')
      TabContent(){email()}.tabBar('邮箱')
      TabContent(){nickName()}.tabBar('我的')
    }.barPosition(BarPosition.End)
  }
}

@Component
struct avatar {
  @Consume user: UserInfoModel

  build() {
    Column() {
      Text(this.user.avatar)
    }
  }
}
@Component
struct  phone{
  @Consume user: UserInfoModel

  build() {
    Column() {
      Text(this.user.phone.toString())
    }
  }
}

@Component
struct email  {
  @Consume user: UserInfoModel

  build() {
    Column() {
      Text(this.user.email)
    }
  }
}
@Component
struct nickName {
  @Consume user: UserInfoModel

  build() {
    Column() {
      Text(this.user.nickName)
    }
  }
}