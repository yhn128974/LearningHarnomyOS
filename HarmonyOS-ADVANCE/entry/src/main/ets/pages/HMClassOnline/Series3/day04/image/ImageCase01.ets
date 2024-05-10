@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row(){
        Image('/assets/banner_01_1.jpg').width(100).aspectRatio(1).rotate({
          angle:180
        })
      }.justifyContent(FlexAlign.Center).width('100%')

    }
  }
}

