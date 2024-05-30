import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterCase01 {
  @State message: string = 'RouterCase01';

  onPageShow(): void {
    promptAction.showToast({
      message: `页面数量:${router.getLength()}
      路由参数:${JSON.stringify(router.getParams())}
      页面状态:${JSON.stringify(router.getState())}`
    })
  }


  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('push跳转02')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase02'
            })
          })
        Button('replace跳转02')
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase02'
            })
          })
        Button('clear清除记录')
          .onClick(() => {
            router.clear()
            promptAction.showToast({
              message: '清空记录'
            })
          })
        Button('back返回')
          .onClick(() => {
            router.back()
          })
        Button('携带参数跳转')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase02',
              params: {
                id: 'id01'
              }
            })
          })

        Button('单例跳转02')
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase02'
            },router.RouterMode.Single)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}