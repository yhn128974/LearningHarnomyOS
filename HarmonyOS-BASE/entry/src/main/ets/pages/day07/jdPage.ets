@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Image($r('app.media.cancel_filled')).width(20)
        Text('帮助').fontColor('#686868').fontSize(16)
      }.justifyContent(FlexAlign.SpaceBetween).width('100%')

      Row() {
        Image($r('app.media.jdlogo')).margin(20).width(250).height(250)
      }.padding(20)

      Row() {
        TextInput({
          placeholder: '国家/地区'
        }).height(40)
      }.padding({

        bottom: 10,
      })

      Row() {
        TextInput({
          placeholder: '请输入手机号'
        }).height(40)
      }.padding({
        top: 10,
        bottom: 10,
      })

      Row() {
        Radio({ value: 'Radio1', group: 'radioGroup' }).width(12)

        Column() {
          Row() {
            Text('我已阅读并同意').fontSize(12).fontColor('#686868')
            Text('《京东因素隐私政策》《京东用户服务协议》').fontSize(12).fontColor(Color.Blue)
          }

          Text('未注册手机将自动创建京东号').fontSize(12).fontColor('#686868')


        }.layoutWeight(1).alignItems(HorizontalAlign.Start)

      }.alignItems(VerticalAlign.Top).margin({
        bottom: 10,
        top: 10,
      })

      Row() {
        Button('登录')
          .onClick((event: ClickEvent) => {
            console.log('page well be loading')
          })
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .layoutWeight(1)
          .borderRadius(20)
          .height(40)
      }.margin({
        bottom: 15,
        top: 15,
      })

      Row() {
        Text('新用户注册').fontSize(12).lineHeight(14).fontColor('#686868')
        Text('账号密码登录').fontSize(12).lineHeight(14).fontColor('#686868')
        Text('无法登陆').fontSize(12).lineHeight(14).fontColor('#686868')
      }.justifyContent(FlexAlign.SpaceAround).width('100%')

      Row() {
        Text('其他登陆方向').fontSize(14).lineHeight(22).fontColor('#686868')
      }.margin(28).alignItems(VerticalAlign.Bottom).layoutWeight(1)

      Row() {
        ForEach(['app.media.huawei','app.media.wechat','app.media.weibo','app.media.QQ'], (item:string,index:number) => {
          Image($r(item)).width(34)
        })

      }.justifyContent(FlexAlign.SpaceAround).width('100%').padding({

        bottom:30
      })
    }
    .height('100%').padding(20)
  }
}

