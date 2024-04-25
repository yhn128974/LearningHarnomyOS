import { curves } from '@kit.ArkUI';


@Observed
class Cards {
  url: string
  count: number;
  constructor(url: string, count: number) {
    this.url = url;
    this.count = count;
  }
}

@Entry
@Component
struct Index {
  @State Cardes: Cards[] = [
    new Cards('app.media.bg_00', 0),
    new Cards('app.media.bg_01', 0),
    new Cards('app.media.bg_02', 0),
    new Cards('app.media.bg_03', 0),
    new Cards('app.media.bg_04', 0),
    new Cards('app.media.bg_05', 0),
  ]
  @State ishowCovered: boolean = false;
  @State randomnumber: number = 0;
  @State iShower: boolean = false;
  // 控制获奖的名字
  @State getPrice: string[] = ['hw', 'pg']
  @State priceName: string = 'hw'

  build() {
    Column() {
      // 列表
      List({
        space: 10
      }) {
        ForEach(this.Cardes, (item: Cards, index: number) => {
          ListItem() {
            CardItem({ cardinfo: item })
          }.margin(10)
        })
      }
      .height(300)
      .margin({
        top: 100,
        bottom: 50
      })
      .listDirection(Axis.Horizontal)
      .lanes(2)
      .alignListItem(ListItemAlign.Center)

      // 立即抽卡按钮
      Button('立即抽卡')
        .width(200)
        .backgroundColor('#ED5B8C')
        .stateStyles({
          clicked: {
            .backgroundColor('#EA446C')
          }
        })
        .animation({
          duration: 1000,
          curve: curves.springMotion()
        })
        .onClick(() => {
          this.ishowCovered = true;
          this.randomnumber = Math.floor(Math.random() * 6)
        })

      //遮罩层
      if (this.ishowCovered) {
        Column({ space: 30 }) {
          Text('获取生肖卡')
            .fontColor('#F5EBCF')
            .fontSize(25)
            .fontWeight(600)
          Image($r(`app.media.img_0${this.randomnumber}`))
            .width(200)
          Button('开心收下')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({ width: 2, color: '#FFF9E0' })
            .onClick(() => {
              this.ishowCovered = false;
              this.Cardes[this.randomnumber].count++
              this.Cardes[this.randomnumber].url = `app.media.img_0${this.randomnumber}`
              let counts = 0
              for (let item of this.Cardes) {
                if (item.count > 0) {
                  counts++;
                } else {
                  break;
                }
              }
              if (counts >= 6) {
                this.iShower = true
                for (let index = 0; index < this.Cardes.length; index++) {
                  this.Cardes[index].url = `app.media.bg_0${index}`
                  this.Cardes[index].count = 0
                }
                this.priceName = this.getPrice[Math.floor(Math.random() * this.getPrice.length)]
              }
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.8)')
        .justifyContent(FlexAlign.Center)
        .position({ x: 0, y: 0 })
      }

      //   中奖结果展示
      if (this.iShower) {
        // 抽奖页面-遮罩层
        Column({ space: 50 }) {
          Text('恭喜获得手机一部')
            .fontColor('#F5EBCF')
            .fontSize(25)
            .fontWeight(600)
          Image($r(`app.media.${this.priceName}`))
            .width(300)
          Button('再来一次')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({ width: 2, color: '#FFF9E0' })
            .onClick(() => {
              this.iShower = false
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.8)')
        .justifyContent(FlexAlign.Center)
        .position({ x: 0, y: 0 })
      }
    }
    .width('100%')
    .backgroundImageSize(ImageSize.Auto)
    .backgroundColor('#00000000 ')

  }
}

@Component
struct CardItem {
  @ObjectLink cardinfo: Cards
  build() {
    Badge({
      value: `${this.cardinfo.count}`,
      position: {
        x: 70,
        y: 0
      },
      style: {
        badgeSize: 20,
        color: Color.Orange
      }
    }) {
      Image($r(this.cardinfo.url))
    }
  }
}