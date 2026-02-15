import { preferences } from '@kit.ArkData'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct Demo05Perferences {
  store: preferences.Preferences | null = null

  aboutToAppear(): void {
    // 创建仓库
    this.store = preferences.getPreferencesSync(getContext(this), {
      name: 'test-store'
    })
  }

  build() {
    Column({ space: 10 }) {
      Text('preferences 首选项')
      Button('增加').onClick(() => {
        this.store?.putSync('myName', '张飞')
        this.store?.flush()
      })
      Button('读取').onClick(() => {
        const value = this.store?.getSync('myName', '')
        console.log(value?.toString())
        promptAction.showToast({
          message: value?.toString()
        })
      })
      Button('修改').onClick(() => {
        this.store?.putSync('myName', '貂蝉')
        this.store?.flush()
      })
      Button('删除').onClick(() => {
        this.store?.deleteSync('myName')
        this.store?.flush()
      })
      Button('删库').onClick(() => {
        preferences.deletePreferences(getContext('this'), {
          name: 'test-store'
        })
      })
    }
    .padding({ top: 40 })
    .height('100%')
    .width('100%')
  }
}