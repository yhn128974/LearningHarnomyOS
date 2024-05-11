@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row(){
        // 系统资源图片
        Image($r('sys.media.ohos_ic_public_share')).width(100).aspectRatio(1).rotate({
          angle:180
        })
      }.justifyContent(FlexAlign.Center).width('100%')

    }
  }
}

