@Entry
@Component
struct SideBarContainerExample {
  @State showSideBar: boolean = false

  build() {
    SideBarContainer(SideBarContainerType.Overlay) {
      Column() {
        this.textBuilder('侧边栏')
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#0094ff')
      .width('100%')

      Column() {
        this.textBuilder('内容')
      }
      .backgroundColor(Color.Pink)
      .justifyContent(FlexAlign.Center)
    }
    .showSideBar(this.showSideBar) // 默认隐藏
    .minSideBarWidth(200) // 最小 和 最大设置的一样之后，就无法拖动 SideBar
    .maxSideBarWidth(200)
    .controlButton({
      left: 10,
      top: 10, // left 和 top 控制位置
      width: 100,
      height: 100, // width和 height 设置尺寸
      icons: {
        shown: '/assets/banner_01_1.jpg', // 显示状态图片
        hidden: $r('app.media.ic_01_7'), // 隐藏状态图片
        switching: '/common/day04_05/02.animator/coin4.png'//
      }
    })
  }

  @Builder
  textBuilder(title: string) {
    Text(title)
      .fontSize(30)
      .fontColor(Color.White)
  }
}