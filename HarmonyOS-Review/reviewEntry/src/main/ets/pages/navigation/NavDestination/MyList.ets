@ComponentV2
export struct MyList {
  //共享路由栈
  @Consumer() navPathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        Text('我是列表页').onClick(() => {
          this.navPathStack.pushPath({
            name: "my"
          })
        })

      }
    }.hideTitleBar(true)
  }
}

@Builder
export function myListBuilder() {
  MyList()
}