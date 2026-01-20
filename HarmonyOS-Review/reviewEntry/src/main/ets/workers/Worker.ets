import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { request } from '@kit.BasicServicesKit';
import { UIContext } from '@kit.ArkUI'

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let abilityContext: Context = new UIContext().getHostContext()!

let currentDownLoadTask: request.DownloadTask | null = null;

export interface MessageModel {

  action: 'downLoad' | 'upLoad' | 'pause',
  context: Context

}

//下载文件
async function downloadFile() {

  //开启文件下载
  currentDownLoadTask = await request.downloadFile(abilityContext, {
    url: "https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_package_901_9/8f/v3/ksHBep8lTuS0cWeJJ6J-Ow/devicetool-windows-tool-4.0.0.400.zip?HW-CC-KV=V1&HW-CC-Date=20230904T063307Z&HW-CC-Expire=315360000&HW-CC-Sign=BFC878B2282B19F56A73305444A0C3661FF3D1DD36A13D3A2901D78B3505BC80",
    filePath: abilityContext.filesDir + '/DevDeveloper.zip'
  })

  //监听下载任务
  currentDownLoadTask.on('progress', (current, total) => {
    //4.进度
    const progress: string = (current / total * 100).toFixed(2) + "%"
    //5.通知页面下载进度
    workerPort.postMessage({
      msg: progress
    })
    //下载完成之后关闭销毁worker
    if (current == total) {
      workerPort.close()
    }
  })

}

function pauseDownloadFile() {
  currentDownLoadTask?.pause(() => {

  })
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  const data = event.data as MessageModel
  abilityContext = event.data.context as Context

  if (data.action == 'downLoad') {
    downloadFile()
  } else if (data.action == 'pause') {
    pauseDownloadFile()
  }
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
};