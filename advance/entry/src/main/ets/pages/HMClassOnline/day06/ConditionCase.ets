@Entry
@Component
struct Index {
  @State showImage: boolean = true;

  build() {
    Row() {
      Column() {
        Toggle({
          type: ToggleType.Switch,
          isOn: $$this.showImage
        })

        Image($r('app.media.list_02_1'))
          .width(200)
          .height(200)
          .visibility(this.showImage ? Visibility.Visible : Visibility.Hidden)
      }
      .width('100%')
    }
    .height('100%')
  }
}

