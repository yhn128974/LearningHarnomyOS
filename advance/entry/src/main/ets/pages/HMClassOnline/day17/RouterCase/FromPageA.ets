import { promptAction, router } from '@kit.ArkUI';

interface message {
  text: string
}

@Entry
@Component
struct FromPageA {
  @State message: string = 'Page A';

  aboutToAppear(): void {
    // promptAction.showToast({
    //   message: 'aboutToAppear'
    // })

    // 通过router.Params取值
    // if (router.getParams()) {
    //   promptAction.showToast({
    //     message: JSON.stringify((router.getParams() as message).text)
    //   })
    //
    // }

    //  getState获取当前路由的状态,getLength获取长度

    // 单例模式下不会生新的页面进行压栈操作
    promptAction.showToast({
      message: JSON.stringify(router.getLength())
    })
  }

  onPageShow(): void {
    // promptAction.showToast({
    //   message: 'on_page_show'
    // })

    //
    promptAction.showToast({
      message: JSON.stringify(router.getLength())
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('to page B by push').onClick((event: ClickEvent) => {
          router.pushUrl({ url: 'pages/HMClassOnline/day17/RouterCase/FromPageB' }, router.RouterMode.Single)
        })

        Button('to page B by replace').onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/HMClassOnline/day17/RouterCase/FromPageB',
            params: {
              name: 'LongYou',
              age: 25
            }
          }
          )
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}