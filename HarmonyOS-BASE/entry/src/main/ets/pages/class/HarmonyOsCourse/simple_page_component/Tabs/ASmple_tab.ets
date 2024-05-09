@Entry
@Component
struct TabsExample {
  // 定义一个tabcontroller实例
  private controller: TabsController = new TabsController()

  @Builder
  tabBuilder(title: string) {
    Row() {
      Text(title);
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.controller
      }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }
        // tabBar 可以接收Builder样式
        .tabBar(this.tabBuilder('green'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }
        .tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }
        .tabBar('pink')

      }
      //   vertical属性用于设置页签(TabBar)的排列方向
      .vertical(true)

      // .barWidth('100%') // 设置TabBar宽度
      // .barHeight(60) // 设置TabBar高度

      .barWidth(100)
      .barHeight('100%')

      .width('100%') // 设置Tabs组件宽度
      .height('100%') // 设置Tabs组件高度
      .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
      // 设置bar排列模式
      .barMode(BarMode.Fixed)
    }
    .width('100%')
    .height('100%')
  }
}