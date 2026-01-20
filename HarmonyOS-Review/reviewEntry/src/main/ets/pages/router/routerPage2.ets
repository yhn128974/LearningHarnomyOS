import { promptAction, router } from '@kit.ArkUI';

interface user {
  message: string
  id: string
}

@Entry
@Component
struct RouterPage2 {
  @State message: string = 'Hello World2';

  aboutToAppear(): void {
    let currentUser: user = router.getParams() as user
    promptAction.openToast({

      message: currentUser.message
    })
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('RouterPage2HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/router/routerPage1'
          },
            router.RouterMode.Single)
        })
    }
    .height('100%')
    .width('100%')
  }
}