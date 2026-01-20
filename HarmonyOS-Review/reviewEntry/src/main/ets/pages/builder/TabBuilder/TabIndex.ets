interface TabInterface {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}

let list: TabInterface[] =
  [
    {
      icon: $r("app.media.ic_public_message"),
      selectIcon: $r('app.media.ic_public_message_filled'),
      name: 'wechat',
      title: '微信',
    }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }
  ]

@Entry
@ComponentV2
struct TabIndex {
  @Local currentList: TabInterface[] = list
  @Local currentIndex: number = 0

  @Builder
  tabBarItem(item: TabInterface) {
    Column() {
      Image(this.currentList[this.currentIndex].name == item.name ? item.selectIcon : item.icon)
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(this.currentList[this.currentIndex].name == item.name ? Color.Green : Color.Black)
    }
  }

  build() {
    Tabs({
      index: $$this.currentIndex
    }) {

      ForEach(this.currentList, (item: TabInterface) => {
        TabContent() {
          if (item.name == 'wechat') {
            Wechar({
              name: item.name
            })

          } else {
            Text(item.name)
          }

        }.tabBar(this.tabBarItem(item))
      })
    }
    .height('100%')
    .width('100%')
    .barPosition(BarPosition.End)
    .animationDuration(0)
    .barPosition(BarPosition.Start)
    .vertical(true)
  }
}

@ComponentV2
struct Wechar {
  @Param name: string = ''

  build() {
    Column() {
      Text(this.name).fontSize(20)
      Button('change WeChat').onClick((event: ClickEvent) => {

      })
    }
  }
}