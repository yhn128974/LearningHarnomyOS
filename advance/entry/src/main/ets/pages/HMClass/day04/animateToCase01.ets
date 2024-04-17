import curves from '@ohos.curves'

@Entry
@Component
struct Index {
  // 默认选中 0
  @State currentIndex: number = 0
  // 动画用属性
  @State toTopOpacity: number = 0
  @State toTopTranslateY: number = 100
  @State homeTranslateY: number = 0
  // 控制器
  mainScroller: Scroller = new Scroller()

  build() {
    Tabs({ barPosition: BarPosition.End, }) {
      TabContent() {
        Stack({ alignContent: Alignment.BottomEnd }) {
          Scroll(this.mainScroller) {
            Text('首页内容')
              .fontSize(30)
              .fullSize()
              .height(3000)
              .backgroundColor('#0094ff')
          }
          .fullSize()
          .onScroll(() => {
            if (this.mainScroller.currentOffset().yOffset > 400) {
              animateTo({ curve: curves.springMotion() }, () => {
                // 返回顶部
                this.toTopOpacity = 1
                this.toTopTranslateY = 0
                // 首页 tab 小火箭
                this.homeTranslateY = -25
              })
            } else {
              animateTo({ curve: curves.springMotion() }, () => {
                // 返回顶部
                this.toTopOpacity = 0
                this.toTopTranslateY = 100
                this.homeTranslateY = 0
              })
            }
          })

          Column() {
            Image('/common/day04_05/01.animate/ic_public_arrow_up_0.svg')
              .width(30)
              .margin({ top: -5, bottom: -5 })
              .fillColor(Color.Gray)
            Text('顶部')
              .fontSize(12)
              .fontColor(Color.Gray)
          }
          .translate({ y: this.toTopTranslateY })
          .opacity(this.toTopOpacity)
          .animation({ curve: curves.springMotion() })
          .width(40)
          .height(40)
          .backgroundColor(Color.White)
          .borderRadius(20)
          .offset({ x: -10, y: -40 })

        }

      }
      .tabBar(this.firstTabBuilder('首页', 0, '/common/day04_05/01.animate/mjyp_tabbar_icon_0_selected.png'))

      TabContent() {
        Column() {
          Text('推荐内容')
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .fullSize()
      }
      .tabBar(this.tabBuilder('推荐', 1, '/common/day04_05/01.animate/mjyp_tabbar_icon_1_selected.png', '/common/day04_05/01.animate/mjyp_tabbar_icon_1.png'))

      TabContent() {
        Column() {
          Text('我的内容')
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .fullSize()
      }
      .tabBar(this.tabBuilder('我的', 2, '/common/day04_05/01.animate/mjyp_tabbar_icon_2_selected.png', '/common/day04_05/01.animate/mjyp_tabbar_icon_2.png'))

      TabContent() {
        Column() {
          Text('我的内容')
        }
        .fullSize()
        .backgroundColor('#007DFF')
      }
      .tabBar(this.tabBuilder('我的', 3, '/common/day04_05/01.animate/mjyp_tabbar_icon_3_selected.png', '/common/day04_05/01.animate/mjyp_tabbar_icon_3.png'))
    }
    .width('100%')
    .height('100%')
    .barBackgroundColor('#ccc')
    .scrollable(false)
    .animationDuration(0)
    .onTabBarClick((index: number) => {
      this.currentIndex = index
    })
    .onChange((index: number) => {
      this.currentIndex = index

    })
  }

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: ResourceStr, normalImg: ResourceStr) {
    Column({ space: 5 }) {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#e1a858' : '#6B6B6B')
        .fontSize(12)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  firstTabBuilder(title: string, targetIndex: number, selectedImg: ResourceStr,) {
    Column({ space: 5 }) {
      if (targetIndex === this.currentIndex) {
        Row() {
          Column() {
            Image('/common/day04_05/01.animate/mjyp_tabbar_icon_0_selected.png')
            Image('/common/day04_05/01.animate/mjyp_tabbar_icon_0_1_selected@3x.png')
          }
          .translate({ y: this.homeTranslateY })
        }
        .clip(true)
        .size({ width: 25, height: 25 })
      } else {
        Image('/common/day04_05/01.animate/mjyp_tabbar_icon_1.png')
          .size({ width: 25, height: 25 })
      }

      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#e1a858' : '#6B6B6B')
        .fontSize(12)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)

  }

  @Styles
  fullSize() {
    .width('100%')
    .height('100%')
  }
}