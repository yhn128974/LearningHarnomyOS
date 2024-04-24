import { request } from '@kit.BasicServicesKit'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct DownloadImg {
  @State
  tempPath: string = ''
  netImgUrl: string = 'http://dingyue.ws.126.net/2024/0209/8ec94ea3g00s8l8ki00ytd200f0008cg00it00ag.gif'
  async downLoad () {
  //   构建文件目录
    let filePath=`${getContext().filesDir}/${Date.now()}.gif`
    const task=await request.downloadFile(getContext(),{
      url:this.netImgUrl,
      filePath:filePath
    })
    task.on('progress',(receivedSize:number,totalSize:number)=>{
      promptAction.showToast({
        message:`${receivedSize}/${totalSize}`
      })
    })
    task.on('fail',(err: number)=>{
      promptAction.showToast({
        message:`${err.toString()}`
      })
    })
    task.on('complete',()=>{

      promptAction.showToast({
        message:`下载成功`
      })
      this.tempPath=filePath
    })
  }
  build() {
    Column() {
      Image(this.netImgUrl).width('100%').height(200)
      Divider()
      Button('点击下载图片').onClick((event: ClickEvent) => {
        this.downLoad()
      })
      Image(`file://${this.tempPath}`).width('100%').height(200)

    }
    .height('100%')
  }
}