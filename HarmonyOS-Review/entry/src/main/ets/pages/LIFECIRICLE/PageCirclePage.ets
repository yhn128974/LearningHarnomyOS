import { promptAction, router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct PageCirclePage {
  @Local isShow: boolean = true
  @Local hmVisibility: boolean = true

  aboutToAppear(): void {
    //一开使用的数据请求写在aboutToAppear中
    console.log('PageCirclePage--aboutToAppear')
  }

  build() {

    Column() {

      if (this.isShow) {
        HMlist()
      } else {
        Text('HMlist To Disappear')
      }

      Button('is show HMlist').onClick(() => {
        this.isShow = !this.isShow
      })

      //不会调用生命周期函数说明组件没有被销毁和重新创建
      HMlist().visibility(this.hmVisibility ? Visibility.Visible : Visibility.Hidden)
      Button(' Visibilitable HMlist').onClick(() => {
        this.hmVisibility = !this.hmVisibility
      })

    }
    .height('100%')
    .width('100%')
  }

  onDidBuild(): void {
    console.log('PageCirclePage--onDidBuild')
  }

  onPageShow(): void {
    //页面重新加载需要重新获取的数据写在onPageShow中
    console.log('PageCirclePage--onPageShow')
  }

  onPageHide(): void {
    console.log('PageCirclePage--onPageHide')
  }

  onBackPress(): boolean | void {

    promptAction.showDialog({
      message: 'are you ensure backToHome?',
      buttons: [
        {
          text: 'cancel',
          color: "#ccc"
        },
        {
          text: "confirm",
          color: "green"
        }
      ]
    })
      .then((res) => {
        if (res.index == 1) {
          router.back()

        }

      })
      .catch((err: Error) => {

      })

    console.log('PageCirclePage--onBackPress')
  }

  aboutToDisappear(): void {
    console.log('PageCirclePage--aboutToDisappear')
  }
}

@ComponentV2
struct HMlist {
  aboutToReuse(): void {
    console.log(`HMlist--aboutToReuse`)
  }

  aboutToRecycle(): void {
    console.log(`HMlist--aboutToRecycle`)
  }

  aboutToAppear(): void {
    console.log(`HMlist--aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`HMlist--aboutToDisappear`)
  }

  build() {
    Row() {
      Text('I AM HM LIST')
    }
  }
}