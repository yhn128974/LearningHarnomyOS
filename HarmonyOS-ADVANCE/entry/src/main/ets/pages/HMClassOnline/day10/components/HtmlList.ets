@Preview
@Component
struct HtmlList {
  @Prop listInfos: object[] = []
  @BuilderParam listItemParam: (listInfo: object) => void

  build() {
    //Gird list WWaterFlow.
    // 渲染数组
    List({
      space: 10
    }) {
      ForEach(this.listInfos, (item: object) => {
        ListItem() {
          this.listItemParam(item)
        }
      })

    }
  }
}

export {
  HtmlList
}