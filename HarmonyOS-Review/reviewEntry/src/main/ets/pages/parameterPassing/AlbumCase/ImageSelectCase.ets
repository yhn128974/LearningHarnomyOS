import { SelectImageIcon } from './component/builer'
import { SelectImage } from './component/SelectImage'

@Entry
@ComponentV2
struct ImageSelectCase {
  @Local showDialog: boolean = false
  @Local
  imageList: ResourceStr[] = [
    "https://img.alicdn.com/bao/uploaded/i1/2200989287220/O1CN01UTgtZw23CohhvMuDK_!!4611686018427380532-0-item_pic.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/2200771378843/O1CN01l25lPP2FC8y8b5Tuf_!!0-item_pic.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/2208697808521/O1CN01IbJTAF2Cofxl8xqoo_!!2208697808521.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/2209445790009/O1CN01USMq051BwAcCDGXDz_!!4611686018427380025-0-item_pic.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/3924654642/O1CN01Yi8APk1kA5Yf6PjEK_!!4611686018427386418-0-item_pic.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i4/39773344/O1CN01CKenhh1aZbUN1qBX2_!!39773344.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/1865856284/O1CN017orpbh1wI7y4rTpvZ_!!1865856284.png_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i2/3814895759/O1CN01yopPep1sPg29b9nI9_!!3814895759.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/647022401/O1CN01QWzSFJ1Tbi2OstBpV_!!647022401.jpg_460x460q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/1743539431/O1CN01umXfkD2JXSPK7hbGn_!!1743539431.jpg_460x460q90.jpg_.webp",
  ]
  @Local selectedList: ResourceStr[] = []

  handleCloseBindSheet() {
    this.showDialog = false

  }

  @Builder
  showBuilder() {
    SelectImage({
      imageList: this.imageList,
      electedList: this.selectedList!!,
      closeBindSheet: () => {
        this.handleCloseBindSheet()
      }
    })
  }

  build() {
    Grid() {
      ForEach(this.selectedList, (item: ResourceStr) => {
        GridItem() {
          Image(item)
        }
      })
      GridItem() {

        SelectImageIcon()
      }.aspectRatio(1)

    }
    .onClick(() => {
      this.showDialog = !this.showDialog
    })
    .padding(20)
    .width('100%')
    .height('100%')
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr')
    //半模态弹出层
    .bindSheet(this.showDialog, this.showBuilder(), {
      height: '50%',
      showClose: false
    })
  }
}