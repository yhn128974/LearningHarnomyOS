// entry/src/main/ets/pages/index.ets
import { MyTitleBar, testAdd, minus, ResManager, Log } from 'sharedlibrary';
import { BusinessError } from '@ohos.base';

const TAG = 'Index';

@Entry
@Component
struct Index {
  @State message: string = '';

  build() {
    Column() {
      Text(ResManager.getDesc()).width('100%')

      // List() {
      //
      //   ListItem() {
      //     MyTitleBar()
      //   }
      //   .margin({ left: '35px', top: '32px' })
      //
      //   ListItem() {
      //     Column() {
      //       // ResManager返回的Resource对象，可以传给组件直接使用，也可以从中取出资源来使用
      //       Image(ResManager.getImg())
      //         .id('image')
      //         .borderRadius('48px')
      //
      //     }
      //   }
      //   .width('685px')
      //   .margin({ top: 10, bottom: 10 })
      //   .padding({ left: 12, right: 12, top: 4, bottom: 4 })
      //
      //   ListItem() {
      //     Text(this.message)
      //       .fontSize(18)
      //       .textAlign(TextAlign.Start)
      //       .width('100%')
      //       .fontWeight(500)
      //       .height('100%')
      //   }
      //   .id('add')
      //   .borderRadius(24)
      //   .width('685px')
      //   .height('84px')
      //   .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
      //   .margin({ top: 10, bottom: 10 })
      //   .padding({ left: 12, right: 12, top: 4, bottom: 4 })
      //   .onClick(() => {
      //     Log.info('add button click!');
      //     this.message = 'result: ' + testAdd(1, 2);
      //   })
      //
      // }
      // .alignListItem(ListItemAlign.Center)
    }
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .height('100%')

  }
}