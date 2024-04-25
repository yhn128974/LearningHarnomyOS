@Entry
@Component
struct waterFlowDemo {
  list: string[] = Array.from({ length: 30 })

  // 获取随机高度
  getRandomNumber() {
    return Math.floor(Math.random() * (300 - 200 + 1)) + 200;
  }

  // 随机颜色
  getRandomColor(): ResourceColor {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgba(${r}, ${g}, ${b}, 0.5)`;
  }

  build() {
    WaterFlow({ footer: this.loadMore() }) {
      ForEach(this.list, (item: string, index: number) => {
        FlowItem() {
        }
        .width('100%')
        .height(this.getRandomNumber())
        .backgroundColor(this.getRandomColor())
      })
    }
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr')
  }

  @Builder
  loadMore() {
    Text('加载更多')
      .width('100%')
      .fontSize(30)
      .fontColor(Color.White)
      .backgroundColor(Color.Pink)
  }
}