import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterPage1 {
  @State message: string = 'Hello World1';

  aboutToAppear(): void {
    promptAction.openToast({
      message: router.getLength().toString()
    })
  }

  build() {
    Column() {
      Text(this.message)
        .id('RouterPage1HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/router/routerPage2',
            //params必须是一个对象
            params: {
              message: "hello",
              id: '001',

            }
          },
            //router跳转的第二参数 router.RouterMode可以指定跳转的模式：
            // Single若该页面已经存在可以将该页面直接挪到栈顶不会在添加新的页面站点,
            // 也就是说页面不会被销毁或者重新生成
            router.RouterMode.Single)
        })

      Button('click to sharAbility ').onClick((event: ClickEvent) => {
        //router 可以跨模块跳转 hap>hsp ,hsp=>hsp
        router.pushUrl({
          url: "@bundle:com.example.myapplication/library/ets/pages/Index"
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}