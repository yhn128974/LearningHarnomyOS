import { Content } from './content'
import { Searcher } from './search'

interface Loging {
  username: string,
  password: string;
}

@Entry
@Component
struct body {
  @State isSwitchDateSoure: boolean = true;
  @State isshowCount: boolean = true;
  @State user: Loging[] = []

  build() {
    Column() {
      // isRefresh: $isSwitchDateSoure 建立双向数据绑定
      Searcher({ isRefresh: $isSwitchDateSoure })
      if (this.isshowCount) {
        // 父向子传参
        Content({ isChanged: this.isSwitchDateSoure })
      } else {
        Text('组件被消灭了')
      }
      Button('点击显示组件').onClick((event: ClickEvent) => {
        this.isshowCount = !this.isshowCount
      }).width('100%')

      ForEach(this.user, (item: Loging, index) => {
        Column() {
          Text("用户名" + item.username)
          Text("密码" + item.password)
        }
      })
    }
  }

  aboutToAppear(): void {
    // 可以在这里对数据进行初始化
    console.log('aboutToAppear')
    this.user = [
      {
        username: 'admin',
        password: '123456'
      },
      {
        username: 'admin2',
        password: '789456'
      }
    ]
  }

  onPageShow(): void {
    console.log('onPageShow")')
  }

  onBackPress(): boolean | void {
    console.log('onBackPress')
  }

  onpageHide(): boolean | void {
    console.log('onpageHide')

  }

  aboutToDisappear(): void {
    console.log('aboutToDisappear')
  }
}
