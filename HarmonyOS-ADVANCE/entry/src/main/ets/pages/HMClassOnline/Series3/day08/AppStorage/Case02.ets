import { router } from '@kit.ArkUI'
class Person {
  name: string = '';
  age: number = 0
}

@Entry
@Component
struct AppStorageCase02 {
  // 用法1
  // @StorageProp('userInfo')
  // userInfo:Record<string,string> = {}
  // 用法2
  @State
  userInfo:Person={
    name: '',
    age: 0
  }
  aboutToAppear(): void {
    this.userInfo =AppStorage.get('userInfo')!
  }
  build() {
    Column() {
      Row({ space: 20 }) {
        Column({ space: 10 }) {
          Text(`姓名：${this.userInfo.name}`)
          Text(`年龄：${this.userInfo.age}岁`)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("退出")
        .onClick(()=>{
          AppStorage.set('userInfo',null)
          router.back()
        })
    }
    .width('100%')
    .height('100%')
  }
}