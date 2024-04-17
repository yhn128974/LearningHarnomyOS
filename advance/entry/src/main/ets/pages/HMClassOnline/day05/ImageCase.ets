@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {

        Grid(){
          GridItem(){
            Image('/assets/banner_01_1.jpg').width('100%').aspectRatio(1)

          }
          GridItem(){
            Image('https://www.boxuegu.com/_nuxt/img/header-new2.393a073.png').aspectRatio(1).height(100)

          }
          GridItem(){
            Image($r('app.media.icon')).width(100)

          }
          GridItem(){
            Image($rawfile("hot_01.svg")).width(100)

          }
          GridItem(){
            Image('/assets/banner_01_1.jpg').width('100%').aspectRatio(1)

          }
          GridItem(){
            Image('https://www.boxuegu.com/_nuxt/img/header-new2.393a073.png').aspectRatio(1).height(100)

          }
          GridItem(){
            Image($r('app.media.icon')).width(100)

          }
          GridItem(){
            Image($rawfile("hot_01.svg")).width(100)

          }
        }.columnsTemplate('1fr 1fr 1fr').rowsGap(20)
        // 本地路径|网络图片



      }
      .width('100%')
    }
    .height('100%')
  }
}