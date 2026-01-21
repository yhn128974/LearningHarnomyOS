import { AppStorageV2, window } from '@kit.ArkUI'
import { currentUIAbilityContext } from '../../models/contexts'
import { Context } from '@kit.AbilityKit'

class StatusBar {
  setLightBar() {
    this.setStatusBar({
      statusBarContentColor: '#FFFFFF'//16进制不能简写
    })
  }

  setDarkBar() {
    this.setStatusBar({
      statusBarContentColor: '#000000'//16进制不能简写
    })
  }

  async setStatusBar(systemBarProperties: window.SystemBarProperties) {
    let context: Context = AppStorageV2.connect(currentUIAbilityContext)?.context!

    await window.getLastWindow(context).then((window) => {
      //
      window.setWindowSystemBarProperties(systemBarProperties)
    })
  }
}

export let statusBar = new StatusBar()