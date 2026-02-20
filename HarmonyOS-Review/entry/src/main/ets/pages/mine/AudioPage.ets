import { HcNavBar } from "../../commons/components"
import { abilityAccessCtrl, Permissions } from "@kit.AbilityKit"
import { permission } from "../../models/permission"
import { promptAction } from "@kit.ArkUI"
import { navPathStack } from "../../commons/utils"

@Component
struct AudioPage {
  permissions: Permissions[] = ['ohos.permission.MICROPHONE']
  confirmConfig: promptAction.ShowDialogOptions = {
    title: "温馨提示",
    message: "未授权使用麦克风将无法使用该面试录音功能，是否前往设置进行授权？",
    buttons: [
      { text: '离开', color: $r('app.color.common_gray_01') },
      { text: '去授权', color: $r('app.color.black') }
    ]
  }

  aboutToAppear(): void {
    this.requestPermission()
  }

  async requestPermission() {
    // 1. 用户授权
    const flag: boolean = await permission.requestPermissions(this.permissions)
    if (flag) {
      return
    }
    // 2. 二次授权
    else {
      try {
        const confirm = await promptAction.showDialog(this.confirmConfig)
        if (confirm.index === 1) {
          const isOk2 = await permission.openPermissionSetting(this.permissions)
          if (isOk2) {
            return
          }
        }
        //
        navPathStack.pop()
      } catch (e) {
        promptAction.showToast({ message: '未授权' })
        navPathStack.pop()
      }


    }
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      HcNavBar({ title: '录音功能' })

    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function AudioBuilder() {
  AudioPage()
}