// xxx.ets
@Entry
@Component
struct ModalTransitionExample {
  @State isShow: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#0094ff')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Button(`显示全屏模态${this.isShow}`)
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindContentCover(this.isShow, this.myBuilder(),{
          modalTransition: ModalTransition.DEFAULT, // DEFAULT:从下往上，ALPHA:透明度淡入, NONE:没有
          backgroundColor: Color.Pink, // 背板颜色 如果内容设置了颜色，这里可以省略
          onAppear: () => {
            console.log('onAppear 执行啦') // 显示之后执行
          },
          onDisappear: () => {
            console.log('onDisappear 执行啦') // 隐藏之后执行
          }
        }
        )
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}