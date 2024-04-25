@Entry
@Component
struct NavigationCase2 {
  // 声明一个pathStack对象
  @Provide
  stackPath: NavPathStack = new NavPathStack()

  @Styles
  gridStyle(){
    .height(100)
    .borderRadius(10)
    .backgroundColor(Color.Pink)
    .margin(10)
  }

  @Builder
  getPageContent(name: string) {

    if (name === "friend") {
      // 渲染朋友圈组件
      Friend()
    }
    else if (name === "my") {
      // 渲染朋友圈组件
      My()
    }
    else if (name === "connect") {
      // 渲染朋友圈组件
      Connect()
    }
    else if (name === "chat") {
      // 渲染朋友圈组件
      Chat()
    }

  }

  build() {
    Navigation(this.stackPath) {
      //   四个导航
      //   朋友圈，我的，联系人，聊天
      GridRow({
        columns: 2
      })
      {

        GridCol() {
          Text('朋友圈').layoutWeight(1).fontColor(Color.White)
        }.gridStyle().onClick(() => {
          this.stackPath.pushPathByName('friend', null)
        })

        GridCol() {
          Text('我的').layoutWeight(1).fontColor(Color.White)
        }.gridStyle().onClick(() => {
          this.stackPath.pushPathByName('my', null)
        })

        GridCol() {
          Text('联系人').layoutWeight(1).fontColor(Color.White)
        }.gridStyle().onClick(() => {
          this.stackPath.pushPathByName('connect', null)
        })

        GridCol() {
          Text('聊天').layoutWeight(1).fontColor(Color.White)
        }.gridStyle().onClick(() => {
          this.stackPath.pushPathByName('chat', null)
        })
      }
    }
    .navDestination(this.getPageContent)
    .title('微信主页')
    .titleMode(NavigationTitleMode.Mini)
  }
}

@Component
struct Friend {
  @Consume
  stackPath: NavPathStack

  build() {
    NavDestination() {
      Text("朋友圈组件")
      Button('跳转到我的页面').onClick((event: ClickEvent) => {
        this.stackPath.pushPathByName('my', null)
      })
    }
    .title("朋友圈")
  }
}

@Component
struct My {
  build() {
    NavDestination() {
      Text("我的")
    }
    .title("我的")
  }
}

@Component
struct Connect {
  build() {
    NavDestination() {
      Text("联系人")
    }
    .title("联系人")
  }
}

@Component
struct Chat {
  build() {
    NavDestination() {
      Text("聊天")
    }
    .title("聊天")
  }
}