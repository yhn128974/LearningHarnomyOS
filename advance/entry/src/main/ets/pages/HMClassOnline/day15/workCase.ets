import { MessageEvents, worker } from '@kit.ArkTS';

@Entry
@Component
struct WarkCase {
  build() {
    Row() {
      Column() {
        Text('this.message')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('开启多线程').onClick((event: ClickEvent) => {
          // 同对象的目录实例化neworker
          let neworker = new worker.ThreadWorker('entry/ets/workers/Worker')

          // 向目标发生消息
          neworker.postMessage('hello world!')

          // 接收neworker的消息
          neworker.onmessage = (res: MessageEvents) => {
            AlertDialog.show({
              message: res.data
            })
            // 得到结果之后就销毁该线程
            neworker.terminate() //销毁
          }

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}