import { SortType } from "../../../models"

export interface FilterButtonModel {
  text: string
  isSort: boolean
  sortType: SortType
}

export const filterButtonList: FilterButtonModel[] =
  [{ text: '默认', isSort: false, sortType: SortType.Default },
    { text: '浏览量', isSort: true, sortType: SortType.ViewLow },
    { text: '难度', isSort: true, sortType: SortType.ViewHeight },
    { text: '推荐', isSort: false, sortType: SortType.Commend }]

@ComponentV2
export struct FilterButton {
  @Param text: string = ''
  @Param isNew: boolean = false
  @Param isSort: boolean = false
  @Param selected: boolean = false

  build() {
    Row() {
      Text(this.text)
        .fontSize(12)
        .fontColor(this.selected ? $r('app.color.common_main_color') : $r('app.color.black'))
      if (this.isNew) {
        Image($r('app.media.ic_home_new'))
          .width(32)
          .height(14)
          .objectFit(ImageFit.Contain)
          .position({ right: -26, top: -7 })
      }
      if (this.isSort) {
        Column() {
          Image($r('sys.media.ohos_ic_public_arrow_up'))
            .size({ width: 12, height: 6 })

          Image($r('sys.media.ohos_ic_public_arrow_down'))
            .size({ width: 12, height: 6 })

        }
        .margin({ top: -0.5, left: 2 })
      }
    }
    .height(30)
    .padding({ left: 10, right: 10 })
    .backgroundColor($r('app.color.common_gray_bg'))
    .borderRadius(4)
    .margin({ top: 12, right: this.isNew ? 26 : 10 })
  }
}