@Entry
@ComponentV2
struct TogglePage {
  @Local flage: boolean = false
  @Local isShow: boolean = true

  build() {
    RelativeContainer() {
      Column() {
        Text('飞行模式')
        Toggle({
          type: ToggleType.Switch,
          //$$ 双向数据绑定
          isOn: $$this.flage
        }).onChange(value => {
          this.flage = value
          this.isShow = !this.isShow
        })

        if (this.flage) {
          Text('5G冲浪中✈')

        } else {
          Text('网络已关闭')
        }

        //Visibility.None 不占位置,Visibility.Hidden 暂位置隐藏后页面布局不会改变
        Image($r('app.media.img')).visibility(this.flage ? Visibility.Visible : Visibility.Hidden).height(50)


      }.alignItems(HorizontalAlign.End).width('100%')

      Column() {

      }
      .width('50%')
      .height('100%')
      .position({
        left: 0,
        top: 0
      })
      .translate({
        x: this.isShow ? 0 : '-100%'
      })
      .animation({
        //动画时长 200ms
        duration: 200
      })
      .backgroundColor(Color.Orange)

    }
    .height('100%')
    .width('100%')
  }
}