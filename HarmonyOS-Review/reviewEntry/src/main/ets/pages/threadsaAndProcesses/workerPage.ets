import { worker } from '@kit.ArkTS';
import { MessageModel } from '../../workers/Worker';

@Entry
@ComponentV2
struct WorkerPage {
  @Local progress: string = '0%';
  localWorker?: worker.ThreadWorker

  createWorker() {

    //work文件路径规范:模块名/est/worker文件夹名/worker文件名.ets
    const newWork = new worker.ThreadWorker('entry/ets/workers/Worker.ets')
    this.localWorker = newWork

    //发送消息事件
    newWork.postMessage({
      action: 'downLoad',
      context: this.getUIContext().getHostContext()
    } as MessageModel)

    //监听消息事件
    newWork.onmessage = (event) => {
      this.progress = event.data.msg as string
    }
  }

  build() {
    Column() {
      Text(this.progress).fontSize(30)

      //
      Button('START DOWNLOAD').onClick(() => {
        this.createWorker()
      })
    }
    .height('100%')
    .width('100%')
  }
}