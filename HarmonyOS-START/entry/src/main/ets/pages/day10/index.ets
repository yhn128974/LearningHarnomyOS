import curves from '@ohos.curves'
// 1. 定义接口（初始页面）
interface ImageCount {
  url: ResourceStr
  count: number
}


@Entry
@Component
struct Index {
  // 2. 根据接口，准备数据
  @State
  images: ImageCount[] = [
    {url: 'app.media.bg_00', count: 0},
    {url: 'app.media.bg_01', count: 0},
    {url: 'app.media.bg_02', count: 0},
    {url: 'app.media.bg_03', count: 0},
    {url: 'app.media.bg_04', count: 0},
    {url: 'app.media.bg_05', count: 0}
  ]

  // 遮罩层交互动画数据
  @State maskOpacity: number = 0 // 透明度
  @State maskZIndex: number = -1 // 显示层级
  @State maskImgX: number = 0 // 图片缩放比
  @State maskImgY: number = 0 // 图片缩放比

  // 随机生肖卡序号
  @State randomIndex: number = -1 // 随机图片标号、数据下标

  // 是否中奖变量
  @State isGet: boolean = false // 中奖控制变量
  @State prize: string = 'xm' // 中奖名称

  build() {
    Column() {
      // 卡片展示区
      List() {
        ForEach(this.images, (item: ImageCount, index) => {
          ListItem() {
            Badge({
              value: `${item.count}`,
              position: BadgePosition.RightTop,
              style: { badgeSize: 16, badgeColor: '#FA2A2D' }
            }) {
              Image($r(`${item.url}`))
                .width(80)
            }
          }
          .padding(10)
        })
      }
      .margin({top: 100, bottom: 50})
      .height(300)
      .listDirection(Axis.Horizontal)
      .lanes(2)

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
          // 单击-抽卡（显示遮罩层）
        .onClick(() => {
          this.maskOpacity = 1
          this.maskZIndex = 99
          this.maskImgX = 1
          this.maskImgY = 1
          // 单击后生成0-5随机数
          this.randomIndex = Math.floor(Math.random() * 6)
        })



      if (this.isGet) {
        // 抽奖页面-遮罩层
        Column({space: 50}) {
          Text('恭喜获得手机一部')
            .fontColor('#F5EBCF')
            .fontSize(25)
            .fontWeight(600)
          Image($r(`app.media.${this.prize}`))
            .width(300)
          Button('再来一次')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({width: 2, color: '#FFF9E0'})
              // 再来一次
            .onClick(() => {
              // 关闭遮罩
              this.maskOpacity = 0
              this.maskZIndex = -1
              // 中奖结果置为 false
              this.isGet = false
              // 初始化数据
              this.images = [
                {url: 'app.media.bg_00', count: 0},
                {url: 'app.media.bg_01', count: 0},
                {url: 'app.media.bg_02', count: 0},
                {url: 'app.media.bg_03', count: 0},
                {url: 'app.media.bg_04', count: 0},
                {url: 'app.media.bg_05', count: 0}
              ]
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.8)')
        .justifyContent(FlexAlign.Center)
        .position({x: 0, y: 0})
      } else {
        // 点击抽卡按钮后显示的遮罩层
        Column({space: 30}) {
          Text('获取生肖卡')
            .fontColor('#F5EBCF')
            .fontSize(25)
            .fontWeight(600)
          // 使用生成的随机数筛选生肖卡
          Image($r(`app.media.img_0${this.randomIndex}`))
            .width(200)
              // 图片动画
            .scale({x: this.maskImgX, y: this.maskImgY})
            .animation({
              duration: 500
            })
          Button('开心收下')
            .width(200)
            .height(50)
            .backgroundColor(Color.Transparent)
            .border({width: 2, color: '#FFF9E0'})
            .onClick(() => {
              this.maskOpacity = 0
              this.maskZIndex = -1
              this.maskImgX = 0
              this.maskImgY = 0
              // 更新对象数组
              this.images[this.randomIndex] = {
                url: `app.media.img_0${this.randomIndex}`,
                count: ++this.images[this.randomIndex].count
              }

              // 判断是否可以抽奖：定义count变量保存已经获得的卡片种类数量（如果每个生肖卡数量>=1,则count+1）
              // 如果count == 6，说明已经得到了6种卡，则可以抽奖
              let count: number = 0
              for (const item of this.images) {
                if (item.count >= 1) {
                  ++count
                } else {
                  break
                }
              }
              if (count == 6) {
                this.isGet = true
                // 所有的奖品
                const arr = ['hw', 'xm', 'pg']
                // 获取随机下标 0 -- 2
                const index = Math.floor(Math.random() * 3)
                // 获取随机名称
                this.prize = arr[index]
              } else {
                // 如果不等于 6 说明
                this.maskOpacity = 0
                this.maskZIndex = -1
              }
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.8)')
        .justifyContent(FlexAlign.Center)
        .position({x: 0, y: 0})
        // 遮罩层交互
        .opacity(this.maskOpacity)
        .zIndex(this.maskZIndex)
      }
    }
    .width('100%')
    .height('100%')
  }
}