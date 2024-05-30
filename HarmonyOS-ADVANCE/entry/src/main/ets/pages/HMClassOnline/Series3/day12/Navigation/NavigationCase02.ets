@Entry
@Component
struct NavigationCase02 {
  // API11
  @Builder
  navDesBuilder(name: string) {
    // 这个builder用于条件渲染展示的页面
    if (name === 'one') {
      // 必须用NavDestination才能显示
      NavDestination() {
        Text('one')
        Button('去TWO')
          .onClick(() => {
            this.navPathStack.pushPath({
              name: 'two'
            })
          })
      }.title('123')
      .hideTitleBar(true)

      // .mode(NavDestinationMode.DIALOG)
    }
    else if (name === 'two') {
      // 可以用组件
      NavigationChild()
    }
  }

  // 1.NavPathStack + navDestination(NavDestination)
  @Provide
  navPathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.navPathStack) {
      // FREE类型滚动时会自动收起
      Scroll() {
        Column({ space: 20 }) {
          Button('下一页')
            .onClick(() => {
              this.navPathStack.pushPath({
                name: 'one'
              })
            })
          Image($r('app.media.ic_01_2'))
          Image($r('app.media.ic_01_2'))
          Image($r('app.media.ic_01_2'))
        }
      }
    }
    .navDestination(this.navDesBuilder)
    .title('西北吴彦祖')
    .titleMode(NavigationTitleMode.Free)
  }
}

@Component
struct NavigationChild {
  @Consume
  navPathStack: NavPathStack

  build() {
    NavDestination() {
      Text('two')
      Button('去THREE')
        .onClick(() => {
          // 只要跳了，就会有个页面，只不过条件渲染没匹配上，不知道渲染什么
          this.navPathStack.pushPath({
            name: 'three'
          })
        })
    }
    .backButtonIcon($r('app.media.ic_01_2'))
  }
}

@Component
struct NavigationChild2 {
  build() {
    NavDestination() {
      Text('three')
    }
  }
}