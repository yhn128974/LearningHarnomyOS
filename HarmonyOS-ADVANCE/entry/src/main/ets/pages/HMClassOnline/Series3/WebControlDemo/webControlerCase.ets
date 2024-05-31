import { promptAction } from '@kit.ArkUI'
import webview from '@ohos.web.webview'

@Entry
@Component
struct WebCase {
  controller:WebviewController = new webview.WebviewController()
  aboutToAppear(): void {

  }
  testFn(){
    promptAction.showToast({
      message:'h5让我弹的'
    })
  }
  build() {

    Column() {
      Column() {
        // 鸿蒙控制网页的方法
        Button('变！')
          .onClick(()=>{
            this.controller.runJavaScript('changeText()',(err,result)=>{
              if(err){
                promptAction.showToast({
                  message:'err:'+err.message
                })
              }
              if(result){
                promptAction.showToast({
                  message:'success:'+result
                })
              }
            })
          })
        // 鸿蒙控制给网页注入鸿蒙的方法,
        Button('注入事件')
          .onClick(()=>{

            this.controller.registerJavaScriptProxy({
              objKey:()=>{
                this.testFn()
              }
            },'objName',['objKey'])
          })


        Button('刷新')
          .onClick(()=>{
            this.controller.refresh();
          })

      }
      .width('100%')


      Web({
        src:$rawfile('index.html'),
        controller:this.controller
      })
        .javaScriptAccess(true)



    }
    .height('100%')
  }
}