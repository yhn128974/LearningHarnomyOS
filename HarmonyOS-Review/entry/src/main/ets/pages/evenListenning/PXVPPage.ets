//vp:虚拟像素,对于2k 1440p的设备上异vp等于3px
//倍屏概念：一倍屏1px=vp，二倍平1vp=2px,三倍(2k/1440p)1vp=3px....


//lpx：等比例适配，如果不配置默认一行为720px,lp不需要管理其他屏幕的适配维持宽高在屏幕的比例不变

@Entry
@Component
struct PXVPPage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text('i am text')
      // .width(360)//360vp=1080px,3倍屏
        .width('360lpx')//不配置默认一行为720px,360为720的一半，如果希望配置plx一行的像素大小可以在，资源文件的 配置文件夹的main_page中修改,
        .height(360)
        .backgroundColor(Color.Orange)
        .fontSize(30) //30fp
    }
    .height('100%')
    .width('100%')
  }
}