interface tabinfoInterFace {
  contentText: string,
  tabBarTitle: string,
  selectedImgeName: string,
  normalImgeName: string
}

@Entry
@Component
struct CreateFileCase {
  // 默认选中 0
  @State currentIndex: number = 0
  @State tabInfomation: tabinfoInterFace[] = [{
    contentText: '首页内容',
    tabBarTitle: '首页',
    selectedImgeName: 'ic_tabbar_icon_0',
    normalImgeName: 'ic_tabbar_icon_0_selected'
  }, {
    contentText: '推荐内容',
    tabBarTitle: '推荐',
    selectedImgeName: 'ic_tabbar_icon_1',
    normalImgeName: 'ic_tabbar_icon_1_selected'
  }, {
    contentText: '发现内容',
    tabBarTitle: '发现',
    selectedImgeName: 'ic_tabbar_icon_2',
    normalImgeName: 'ic_tabbar_icon_2_selected'
  }, {
    contentText: '我的内容',
    tabBarTitle: '我的',
    selectedImgeName: 'ic_tabbar_icon_3',
    normalImgeName: 'ic_tabbar_icon_3_selected'
  },]

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabInfomation, (item: tabinfoInterFace, index: number) => {
        TabContent() {
          Column() {
            Text(item.contentText)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#007DFF')
        }
        .tabBar(this.tabBuilder(item.tabBarTitle, index, item.normalImgeName, item.selectedImgeName))
      })
    }
    .width('100%')
    .height('100%')
    .onTabBarClick((index: number) => {
      console.log("" + index)
      this.currentIndex = index
    })

    // .onChange((index: number) => {
    //   console.log(""+index)
    //   this.currentIndex = index
    // })
  }

  @Builder
  tabBuilder(title: string, index: number, selectedImgeName: string, normalImgeName: string) {
    Column() {
      Image(this.currentIndex === index ? $r(`app.media.${selectedImgeName}`) : $r(`app.media.${normalImgeName}`))
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === index ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}