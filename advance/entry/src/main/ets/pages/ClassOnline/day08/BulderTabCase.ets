import { TabBarBuilder } from './Builder'
interface TabBarInfo {
  title: string;
  url: ResourceStr
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @Provide currentIndex: number = 0
  @State TabBarInfo: TabBarInfo[] = [
    {
      title: '微信',
      url: $r('app.media.weichat')
    }, {
    title: '联系人',
    url: $r('app.media.contacter')
  }, {
    title: '发现',
    url: $r('app.media.reseach')
  }, {
    title: '我的',
    url: $r('app.media.mine')
  },
  ]

  @Builder
  TabBarBuilder(title: string, url: ResourceStr, pageIndex: number) {
    Column({
      space:5
    }) {
      Image(url).width(20).fillColor(pageIndex == this.currentIndex ? Color.Green : '#ddd')
      Text(title).fontColor(pageIndex == this.currentIndex ? Color.Green : '#ddd').fontSize(13)
    }
  }

  @Builder
  TabContentBuilder00() {
    Text("hello world00!")
  }

  @Builder
  TabContentBuilder01() {
    Text("hello world01!")
  }

  @Builder
  TabContentBuilder02() {
    Text("hello world02!")
  }

  @Builder
  TabContentBuilder03() {
    Text("hello world03!")
  }

  build() {
    Row() {
      Column() {
        Tabs({
          barPosition: BarPosition.End,
          index:$$this.currentIndex
        }) {
          ForEach(this.TabBarInfo, (item: TabBarInfo, index: number) => {
            TabContent() {
              if (index == 0) {
                this.TabContentBuilder00()
              } else if (index == 1) {
                this.TabContentBuilder01()
              } else if (index == 2) {
                this.TabContentBuilder02()
              } else if (index == 3) {
                this.TabContentBuilder03()
              }
            }
            .tabBar(TabBarBuilder(item.title, item.url, index,this.currentIndex))
            // .tabBar(this.TabBarBuilder(item.title, item.url, index))
          })
        }.onChange((index: number) => {
          this.currentIndex = index
        }).onTabBarClick((index: number) => {
          this.currentIndex = index
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

