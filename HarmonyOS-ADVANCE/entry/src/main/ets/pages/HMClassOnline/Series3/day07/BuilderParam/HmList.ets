@Preview
@Component
  // 列表组件
struct HmList {
  @Prop
  list: object[] = [] // 不知道传入的是什么类型 统一认为是object
  @BuilderParam
  renderItem: (obj: object) => void
aboutToAppear(): void {
}
  build() {
    // Grid List WaterFlow
    // 渲染数组
    List ({ space: 10 }) {
      ForEach(this.list, (item: object) => {
        ListItem() {
          // 自定义的结构
          if(this.renderItem) {
            this.renderItem(item)
            // 函数中的this始终指向调用者
          }
        }
      })
    }
    .padding(20)
  }
}
export { HmList }

// WaterFlow FlowItem  Grid GirdItem  List ListItem