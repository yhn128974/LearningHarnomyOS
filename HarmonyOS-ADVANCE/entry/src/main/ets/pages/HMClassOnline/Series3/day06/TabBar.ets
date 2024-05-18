interface barInfo {
  icon: ResourceStr,
  title: string
  id: number
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State currentContent: number = 0
  @State BarInfoList: barInfo[] = [
    {
      icon: $r('app.media.ic_01_1'),
      title: '微信',
      id: 0
    },
    {
      icon: $r('app.media.ic_01_2'),
      title: '联系人',
      id: 1
    },
    {
      icon: $r('app.media.ic_01_3'),
      title: '发现',
      id: 2
    },
    {
      icon: $r('app.media.ic_01_4'),
      title: '我的',
      id: 3
    },
  ]

  @Builder
  TabBarBuilder(item: barInfo) {
    Column({
      space: 5
    }) {
      Image(item.icon).width(20).aspectRatio(1)
      Text(item.title).fontColor(this.currentContent === item.id ? Color.Green : Color.Gray)
    }
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End
      }) {
        ForEach(this.BarInfoList, (item: barInfo) => {
          TabContent() {
            Column() {
              Text(item.title)
            }
          }.tabBar(this.TabBarBuilder(item))

        })
      }.onChange((index: number) => {
        this.currentContent = index
      }).animationDuration(100)
    }
  }
}

