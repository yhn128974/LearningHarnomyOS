import router from '@ohos.router';


@Entry
@Component
struct Index {
  @State message: string = 'Second Page...';
  // 已知类型
  // @State msg: string = (router.getParams() as Record<string, string>)['msg'];
  // 类型未知
  @State msg: string = (router.getParams() as Record<string, string>)['msg'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.msg)

        Blank()
        Button('返回index').onClick((event: ClickEvent) => {

          // router.enableBackPageAlert({
          //   message: 'Message Info'
          // });


          router.showAlertBeforeBackPage({
            message: '您的操作还未完成，确定要返回吗'
          })

          router.back({
            url: 'pages/day04/router/UIAblility/Index',
            params: {
              src: 'Second页面传来的数据',
            }
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

