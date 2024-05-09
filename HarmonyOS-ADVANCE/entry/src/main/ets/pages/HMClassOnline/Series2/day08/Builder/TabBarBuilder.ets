
// 无法追踪数据的更新，只能简单的复用
@Builder
export function TabBarBuilder(title: string, url: ResourceStr, pageIndex: number, currentIndex: number) {
  Column() {
    Image(url).width(20).fillColor(pageIndex == currentIndex ? Color.Green : '#ddd')
    Text(title).fontColor(pageIndex == currentIndex ? Color.Green : '#ddd').fontSize(13)
  }
}
