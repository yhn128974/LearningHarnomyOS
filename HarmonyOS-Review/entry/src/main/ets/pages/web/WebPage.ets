import { HcNavBar } from "../../commons/components/HcNavBar"
import { webview } from '@kit.ArkWeb'
import { navPathStack } from "../../commons/utils/navPathStack"

export interface WebPageParams {
  title: string
  src: string
}

@ComponentV2
struct WebPage {
  @Local title: string = ''
  @Local src: string = ''

  controller = new webview.WebviewController()

  aboutToAppear(): void {
    const params: WebPageParams = navPathStack.getParamByName('WebPage').pop() as WebPageParams
    this.title = params.title
    this.src = params.src
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        //
        HcNavBar({ title: this.title, showRightIcon: false })
        //
        Web({ src: this.src, controller: this.controller })
          .layoutWeight(1)
          .width('100%')
      }
      .height('100%')
      .width('100%')
    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function WebBuilder() {
  WebPage()
}