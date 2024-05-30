import { promptAction, router } from '@kit.ArkUI';

interface getid {
  id: string
}

@Entry
@Component
struct RouterCase02 {
  @State message: string = 'RouterCase02';
  @State myid: string = ''

  aboutToAppear(): void {
    let res = router.getParams() as getid

    this.myid = res.id
    promptAction.showToast({
      message: JSON.stringify(res.id)
    })
  }

  onPageShow(): void {
    promptAction.showToast({
      message: `页面数量:${router.getLength()}
      路由参数:${JSON.stringify(router.getParams())}
      页面状态:${JSON.stringify(router.getState())}`
    })
  }

  onBackPress(): boolean | void {
    AlertDialog.show({
      message: 'I well back '
    })
  }

  build() {
    Row() {

      Column() {
        Text(this.myid)

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('push跳转01')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase01'
            })
          })

        Button('返回').onClick((event: ClickEvent) => {
          router.showAlertBeforeBackPage({
            message: 'are you ensure ?'
          })
          router.back({
            url: 'pages/HMClassOnline/Series3/day12/router/RouterCase01'
          })
        })

        Button('单例跳转01')
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/HMClassOnline/Series3/day12/router/RouterCase01'
            }, router.RouterMode.Single)
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}