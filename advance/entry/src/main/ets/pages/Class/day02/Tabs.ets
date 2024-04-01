@Entry
@Component
struct Index {
  // 默认选中 0
  @State currentIndex: number = 0

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Column() {
          Text('首页内容')
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#007DFF')
      }
      .tabBar(this.tabBuilder('首页', 0, '/common/day02/mjyp_tabbar_icon_0_selected.png', '/common/day02/mjyp_tabbar_icon_0.png'))

      TabContent() {
        Column() {
          Text('推荐内容')
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#007DFF')
      }
      .tabBar(this.tabBuilder('推荐', 1, '/common/day02/mjyp_tabbar_icon_1_selected.png', '/common/day02/mjyp_tabbar_icon_1.png'))

      TabContent() {
        Column() {
          Text('发现内容')
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#007DFF')
      }
      .tabBar(this.tabBuilder('我的', 2, '/common/day02/mjyp_tabbar_icon_2_selected.png', '/common/day02/mjyp_tabbar_icon_2.png'))

      TabContent() {
        Column() {
          Text('我的内容')
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#007DFF')
      }
      .tabBar(this.tabBuilder('我的', 3, '/common/day02/mjyp_tabbar_icon_3_selected.png', '/common/day02/mjyp_tabbar_icon_3.png'))
    }
    .width('100%')
    .height('100%')
    .onTabBarClick((index: number) => {
      // 获取索引 并赋值
      this.currentIndex = index
    })
    // .onChange((index: number) => {
    //   // 获取索引 并赋值
    //   this.currentIndex = index
    // })
    .barMode(BarMode.Fixed)
  }

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: ResourceStr, normalImg: ResourceStr) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}