@Entry
@Component
struct BindSheetPage {
  @State message: string = 'Hello World';
  @State isShowBindsheet: boolean = false;

  @Builder
  bindSheetBuilder() {
    Column() {
      Button('点击关闭模态').onClick((event: ClickEvent) => {
        this.isShowBindsheet = false
      })
    }.backgroundColor(Color.Pink).height(400).width('100%').borderRadius(0)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('点击开启模态框').onClick((event: ClickEvent) => {
          this.isShowBindsheet = true
        }).bindSheet(
          $$this.isShowBindsheet, this.bindSheetBuilder(), {
          height: 180, // 高度
          dragBar: false, // 关闭控制条
          backgroundColor: Color.White,
          maskColor: 'rgba(0, 0, 0, 0.5)', // 背景颜色 黑色半透明
          onAppear: () => {
            console.log('onAppear 出现了~')
          },
          onDisappear: () => {
            console.log('onDisappear 消失了~')
          }
        }
        )
      }
      .width('100%')
    }
    .height('100%')
  }
}