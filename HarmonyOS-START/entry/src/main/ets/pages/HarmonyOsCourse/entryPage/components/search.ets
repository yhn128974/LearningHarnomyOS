@Component
export struct Searcher {
  @State message: string = 'there is search bar';
  // 声明与父类的绑定数据
  @Link isRefresh: boolean;

  build() {
    Row() {
      Column() {
        Text(this.message).width('100%').height(30).backgroundColor(Color.Blue)
        Button('点击改变文本状态状态').onClick((event: ClickEvent) => {
          this.isRefresh = !this.isRefresh;
        }).width('100&')
      }
      .width('100%').justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')

  }
}

