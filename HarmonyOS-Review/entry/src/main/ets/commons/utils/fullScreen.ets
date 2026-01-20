import { AppStorageV2, window } from '@kit.ArkUI'
import { AreaHeight } from '../../models/AreaHeight'
import { currentUIAbilityContext } from '../../models/contexts'

class FullScreen {
  //获取顶层的window对象
  currentUIAbilityContext = AppStorageV2.connect(currentUIAbilityContext)!

  //可以将context对象,存到AppStorage中，便于使用
  async enable() {

    if (this.currentUIAbilityContext?.context) {
      //设置沉浸式布局
      await window.getLastWindow(this.currentUIAbilityContext?.context).then((win) => {
        //
        win.setWindowLayoutFullScreen(true)
        //取值
        let topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        let bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        let topHeight = topArea.topRect.height
        let bottomHeight = bottomArea.topRect.height

        //设置内存存储
        let currentAreaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => {
          return new AreaHeight(0, 0)
        })!
        //赋值
        currentAreaHeight.voidAreaTopHeight = px2vp(topHeight)
        currentAreaHeight.voidAreaBottomHeight = px2vp(bottomHeight)
      })

    }


  }

  async disable() {

    if (this.currentUIAbilityContext?.context) {
      //设置沉浸式布局
      await window.getLastWindow(this.currentUIAbilityContext?.context).then((win) => {
        win.setWindowLayoutFullScreen(false)


        //设置内存存储
        let currentAreaHeight: AreaHeight = AppStorageV2.connect(AreaHeight)!
        //赋值
        currentAreaHeight.voidAreaTopHeight = 0
        currentAreaHeight.voidAreaBottomHeight = 0
      })


    }

  }
}

export const fullScreenController: FullScreen = new FullScreen()