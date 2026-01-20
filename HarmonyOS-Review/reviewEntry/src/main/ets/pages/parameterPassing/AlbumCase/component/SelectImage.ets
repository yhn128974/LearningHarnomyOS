@ComponentV2
struct SelectImage {
  @Param
  imageList: ResourceStr[] = []
  //没有用？为了可以用语法糖必须要写？
  @Param electedList: ResourceStr[] = []
  @Local selectedImageList: ResourceStr[] = []

  @Computed
  get selectedImageLength(): number {
    return this.selectedImageList.length
  }

  //在页面渲染前处理数据
  aboutToAppear(): void {
    //避免浅拷贝地址引用到相同地址
    this.selectedImageList = [...this.electedList]
  }

  @Event closeBindSheet: () => void = () => {
  }
  @Event $electedList: (selectedImageList: ResourceStr[]) => void = (selectedImageList: ResourceStr[]) => {
  }

  build() {
    Column() {
      Row() {
        Text('取消').onClick(() => {
          this.closeBindSheet()
        })
        Text(`已选中${this.selectedImageLength} /10 张`)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定').onClick(() => {
          this.$electedList([...this.selectedImageList])
        })
      }.width('100%').padding(20)

      Grid() {
        ForEach(this.imageList, (item: ResourceStr) => {
          GridItem() {
            Stack({
              alignContent: Alignment.TopEnd
            }) {
              Image(item)
              Image($r('sys.media.ohos_ic_public_select_all'))
                .width(30)
                .height(30)
                .aspectRatio(1)
                .margin(5)
                .fillColor(this.selectedImageList.includes(item) ? Color.Orange : Color.White)
            }

          }
          .aspectRatio(1) //宽高比
          .onClick(() => {
            if (!this.selectedImageList.includes(item)) {
              this.selectedImageList.push(item)
            } else {
              this.selectedImageList = this.selectedImageList.filter(image => {
                return image !== item
              })
            }

          }
          )
        })
      }
      .padding(20)
      .layoutWeight(1)
      .rowsGap(10)
      .columnsGap(10)
      .columnsTemplate('1fr 1fr 1fr')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7f8')
  }
}

export { SelectImage }