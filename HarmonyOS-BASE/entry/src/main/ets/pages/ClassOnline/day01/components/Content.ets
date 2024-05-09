@Component
export  struct Content {
  build() {
    Column() {
      Text('我是有底线的')
    }.layoutWeight(1).justifyContent(FlexAlign.End)
  }
}