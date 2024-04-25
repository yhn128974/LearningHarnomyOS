// bootom数据
import { MapComponent } from '@hms.core.map.MapComponent';

interface informations {
  location: string;
  title: string
}

let bottominformation: informations[] = [
  {
    location: "app.media.zhifubao",
    title: ''
  },
  {
    location: "app.media.zhicai",
    title: '理财'
  },
  {
    location: "app.media.life_hose",
    title: '生活'
  },
  {
    location: "app.media.message1",
    title: '信息'
  },
  {
    location: "app.media.mine",
    title: '我的'
  }
]

const iconsInformation: informations[][] = [
  [
    {
      location: "app.media.chuxing",
      title: '滴滴出行'
    },
    {
      location: "app.media.lifepay",
      title: '生活缴费'
    }, {
    location: "app.media.gupiao",
    title: '股票'
  }, {
    location: "app.media.mayishengling",
    title: '蚂蚁森林'
  }, {
    location: "app.media.cellular_phone",
    title: '手机充值'
  },
  ], [
  {
    location: "app.media.yuebao",
    title: '余额宝'
  },
  {
    location: "app.media.huabei",
    title: '花呗'
  }, {
  location: "app.media.feizhu",
  title: '飞猪旅行'
}, {
  location: "app.media.taopiaopiao",
  title: '淘票票'
}, {
  location: "app.media.elima",
  title: '饿了吗'
},
], [
  {
    location: "app.media.chuxing",
    title: '听书看书'
  },
  {
    location: "app.media.jijing",
    title: '基金'
  }, {
  location: "app.media.zhibuo",
  title: '直播广场'
}, {
  location: "app.media.yiliao",
  title: '医疗健康'
}, {
  location: "app.media.more",
  title: '更多'
},
]
]

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {

    Stack({
      alignContent: Alignment.Bottom
    }) {
      // 搜索栏
      Row({
        space: 10
      }) {
        //
        Row() {
          Column() {
            Text('北京').fontColor(Color.White)
            Text('晴 2℃').fontColor(Color.White)
          }

          Row() {
            Image($r('app.media.down_arrow')).width(12).fillColor(Color.White)
          }.alignItems(VerticalAlign.Top).height('100%').margin({
            top: 15
          })
        }

        Row() {
          Image($r('app.media.search')).width(15).height(15).margin({
            left: 5
          })
          TextInput({
            placeholder: '北京交通卡'
          }).layoutWeight(1).width('10%').backgroundColor(Color.White)
          Text('|')
          Button('搜索')
            .onClick((event: ClickEvent) => {
              console.log('there is result');
            })
            .type(ButtonType.Normal)
            .backgroundColor(Color.White)
            .fontColor(Color.Blue)
            .borderRadius(10)
        }.backgroundColor(Color.White).borderRadius(10).layoutWeight(1)

        Row() {
          Image($r('app.media.add')).height(30).width(30).fillColor(Color.White)
        }
      }
      .position({
        x: 0
      })
      .width('100%')
      .height(60)
      .backgroundColor('#118AD3')
      .position({
        x: 0,
      })
      .zIndex(1)
      .padding({
        right: 10,
        left: 10
      })

      // 滑动区
      Scroll() {
        Column() {
          // 常用栏
          Row() {
            Column() {
              Image($r('app.media.saoyisao')).fillColor(Color.White).width(50).height(50).fillColor(Color.White)
              Text('扫一扫').fontColor(Color.White)
            }

            Column() {
              Image($r('app.media.soufukuan')).width(50).height(50).fillColor(Color.White)
              Text('收付款').fontColor(Color.White)
            }

            Column() {
              Image($r('app.media.goout')).width(50).height(50).fillColor(Color.White)
              Text('出行').fontColor(Color.White)
            }

            Column() {
              Image($r('app.media.card_bag')).width(50).height(50).fillColor(Color.White)
              Text('卡包').fontColor(Color.White)
            }
          }.width('100%').justifyContent(FlexAlign.SpaceAround).backgroundColor('#118AD3').padding(20)

          //小程序栏
          Column({
            space: 10
          }) {
            ForEach(iconsInformation, (items: informations[], index) => {
              Row({
                space: 5
              }) {
                ForEach(items, (item: informations, index) => {
                  Column() {
                    Image($r(item.location)).width(28).height(28).margin({
                      bottom: 8
                    })
                    Text(item.title).fontSize(12).fontColor('#666')
                  }.layoutWeight(1)
                })
              }
            })
          }.backgroundColor(Color.White).width('100%').padding(10).borderRadius({
            topLeft: 10,
            topRight: 10
          })

          // 猫猫地区
          Row() {
            ForEach(['app.media.zfb_pro_pic1', 'app.media.zfb_pro_pic2', 'app.media.zfb_pro_pic3'], (item: string, index: number) => {
              Image($r(item)).layoutWeight(1).borderRadius(10).margin(3)
            })


          }.width('100%')

          Column() {
            ForEach(['app.media.zfb_pro_list1','app.media.zfb_pro_list2'], (item: string, index: number) => {
              Image($r(item)).margin(3)
            })
          }
        }.justifyContent(FlexAlign.Start)
      }
      .backgroundColor('#ddd')
      .layoutWeight(1)
      .position({
        y: 60
      })
      .height(660)
      .border({
        width: 1,
        style: BorderStyle.Solid
      })

      // 底部
      Row({}) {
        ForEach((bottominformation), (item: informations, index) => {
          Column() {
            Image($r(item.location)).width(35)
            Text(item.title)
          }
        })
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceAround)

    }.height('100%')

  }
}


