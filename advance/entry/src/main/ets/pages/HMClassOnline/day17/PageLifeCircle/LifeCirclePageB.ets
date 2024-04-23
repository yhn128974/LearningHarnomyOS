import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct LifeCirclePageB {
  @State message: string = 'Page B';

  onPageShow(): void {

  }

  onPageHide(): void {

  }


  aboutToAppear(): void {

  }

  aboutToDisappear(): void {

  }
  onBackPress(): boolean | void {
    this.GetpromptActionDialogIndex()
    return true
  }

  async GetpromptActionDialogIndex() {
    await promptAction.showDialog({
      title: "提示",
      message: '你确定要返回吗？',
      buttons: [
        {
          text: "取消",
          color: "#ff2b52a4"
        },
        {
          text: "确定",
          color: "#ff2b52a4"
        },]
    }).then(res => {
      AlertDialog.show({
        message:res.index.toString()
      })
      if (res.index === 1) {
        router.back({
          url:'pages/HMClassOnline/day17/LifeCircle/LifeCirclePageA'
        })
      }
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)


      }
      .width('100%')
    }
    .height('100%')
  }
}