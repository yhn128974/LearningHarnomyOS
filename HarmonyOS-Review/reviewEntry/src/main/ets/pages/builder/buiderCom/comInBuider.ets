import { currentDate, listData } from '../data'
import { ListerItem } from './buiderCom'
import { promptAction } from '@kit.ArkUI'

@ComponentV2
export struct ListItemWithBuider {
  build() {
    Column({
      space: 10
    }) {
      ForEach(currentDate, (item: listData) => {
        ListerItem(item)
      })
      Button('修改数据').onClick(() => {
        currentDate[0].address = '西安'
        promptAction.openToast({
          message: currentDate[0].address
        })
      })
    }.width('100%').background(Color.White)
  }
}