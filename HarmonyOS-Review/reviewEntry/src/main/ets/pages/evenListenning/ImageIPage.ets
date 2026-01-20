@Entry
@Component
struct ImageIPage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Column() {
        Image($r('app.media.img')).height(50) //使用 resource下的资源文件，推荐图片文件地点
        Image('/assets/img.png').height(50) // 使用自建文件的方式 ’/‘代表ets的初始目录，
        Image($rawfile('img.png')).height(50)
        //如果模拟器不能加载说明没有网络权限
        Image('https://logos-world.net/wp-content/uploads/2021/02/Bing-Symbol.png').height(50)
        //下载SVG图标
        Image($r('app.media.save')).height(50).fillColor(Color.Orange)
        //使用系统内置图标
        Image($r('sys.media.save_button_picture')).width(50)
      }
    }
    .height('100%')
    .width('100%')
  }
}