import { GoodItem } from '../day09/moduls'
import { promptAction } from '@kit.ArkUI'

interface imageIteminfo {
  imageurl: ResourceStr;
  iscelecat: boolean
  id: number
}


@Entry
@Component
struct PropCase {
  @State list: GoodItem[] = [
    {
      id: 1,
      goods_name: "班俏BANQIAO超火ins潮卫衣女士2020秋季新款韩版宽松慵懒风薄款外套带帽上衣",
      goods_img: $r('app.media.1'),
      goods_price: 108,
      good_count: 1,
    }, {
    id: 2,
    goods_name: "嘉叶希连帽卫衣女春秋薄款2020新款宽松bf韩版字母印花中长款外套ins潮",
    goods_img: $r('app.media.2'),
    goods_price: 129,
    good_count: 1,
  },
    {
      id: 3,
      goods_name: "思蜜怡2020休闲运动套装女春秋季新款时尚大码宽松长袖卫衣两件套",
      goods_img: $r('app.media.3'),
      goods_price: 198,
      good_count: 1,
    },
    {
      id: 4,
      goods_name: "思蜜怡卫衣女加绒加厚2020秋冬装新款韩版宽松上衣连帽中长款外套",
      goods_img: $r('app.media.4'),
      goods_price: 99,
      good_count: 1,
    },
    {
      id: 5,
      goods_name: "幂凝早秋季卫衣女春秋装韩版宽松中长款假两件上衣薄款ins盐系外套潮",
      goods_img: $r('app.media.5'),
      goods_price: 156,
      good_count: 1,
    },
    {
      id: 6,
      goods_name: "ME&CITY女装冬季新款针织抽绳休闲连帽卫衣女",
      goods_img: $r('app.media.6'),
      goods_price: 142.8,
      good_count: 1,
    }
  ]
  @State ishowalbum: boolean = false
  @State selectedNumber: number = 5
  @State indexselectPhone: imageIteminfo[] = []
  // @State isshowPhone: boolean = false
  // 无需响应式 Dialog 弹层的组件每次都会被重新创建和销毁
  selectedPhoneIndex: number = 0
  // Dialog 弹层 显示声明对象 类型为CustomDialogController
  preview: CustomDialogController = new CustomDialogController({
    builder: ShowPhone({
      showPhone: this.indexselectPhone[this.selectedPhoneIndex],
    }),
    // 按照弹层的样式来渲染
    customStyle: true,
    cancel: () => {
      promptAction.showToast({ message: '弹层关闭' })
    }
  })

  getselectedPhone(selectPhone: imageIteminfo[]) {
    this.indexselectPhone.push(...selectPhone)
  }

  clearselectedPhone() {
    this.indexselectPhone.splice(0)
  }

  build() {
    Column({
      space: 10
    }) {
      Row() {
        Button('点击选择相册').onClick((event: ClickEvent) => {
          this.ishowalbum = true
        }).width('100%')
      }

      Grid() {
        ForEach(this.indexselectPhone, (item: imageIteminfo, index) => {
          GridItem() {
            Column() {
              Image(item.imageurl).aspectRatio(1).borderRadius(4).onClick(() => {
                // this.isshowPhone = true
                this.selectedPhoneIndex = index
                this.preview.open()
              })
            }
          }
        })
      }
      .columnsTemplate('1fr 1fr ')
      .layoutWeight(1)
      .rowsGap(4)
      .columnsGap(4)
      .layoutWeight(1)


      // if (this.isshowPhone) {
      //   Column() {
      //     ShowPhone({
      //       showPhone: this.indexselectPhone[this.selectedPhoneIndex],
      //       isshowPhone: this.isshowPhone
      //     })
      //   }
      //   .padding(10)
      //   .backgroundColor(Color.Black)
      //   .width('100%')
      //   .height('100%')
      //   .zIndex(2)
      //   .position({
      //     x: 0,
      //     y: 0
      //   })
      // }

    }
    .width('100%')
    .height('100%')
    .padding(10)
    .bindSheet($$this.ishowalbum, this.albumBuilder(), { showClose: false ,height:'70%'})
  }

  // Builder内部可以放置组件
  @Builder
  albumBuilder() {
    Column() {
      // 注意 bindSheet 内部的层级问题
      PhotoAlbum({
        list: this.list,
        ishowalbum: this.ishowalbum,
        selectedNumber: this.selectedNumber,
        fished: (selectPhone: imageIteminfo[]) => {
          this.getselectedPhone(selectPhone)
        },
        clearselectedPhone: () => {
          this.clearselectedPhone()
        }
      }).zIndex(99)
    }

  }
}


@Component
struct PhotoAlbum {
  @Prop list: GoodItem[] = []
  @Link ishowalbum: boolean
  @Prop selectedNumber: number
  @State selectPhone: imageIteminfo[] = []
  fished: (selectPhone: imageIteminfo[]) => void = () => {
  }
  clearselectedPhone: () => void = () => {
  }

  selectImage(item: GoodItem) {
    if (this.selectPhone.some(obj => obj.id === item.id)) {
      const index = this.selectPhone.findIndex(obj => obj.id === item.id)

      this.selectPhone.splice(index, 1)
    } else {
      if (this.selectPhone.length < this.selectedNumber) {
        this.selectPhone.push({
          imageurl: item.goods_img,
          iscelecat: false,
          id: item.id
        })
      }


    }
  }

  getShowSelect(item: GoodItem) {
    return this.selectPhone.some(obj => obj.id === item.id)
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.list, (item: GoodItem,) => {
          GridItem() {
            Stack({
              alignContent: Alignment.BottomEnd
            }) {
              Image(item.goods_img).aspectRatio(1)
              if (this.getShowSelect(item)) {
                Image($r('app.media.selected')).width(50).height(40)
              }
            }
          }.onClick((event: ClickEvent) => {
            this.selectImage(item)
            // this.selectedNumber=this.selectPhone.length
          })
        })

      }
      .columnsTemplate('1fr 1fr 1fr')
      .layoutWeight(1)
      .rowsGap(4)
      .columnsGap(4)

      Row() {
        Button('全部取消').onClick((event: ClickEvent) => {
          this.selectPhone.splice(0)
        }).backgroundColor(Color.Gray)
        Text(`已经选择数目${this.selectPhone.length}/${this.selectedNumber}`)
        Button('确定').onClick((event: ClickEvent) => {
          this.ishowalbum = false
          this.clearselectedPhone()
          this.fished(this.selectPhone)
        })
      }.justifyContent(FlexAlign.SpaceBetween).width('100%').height(50)
    }

    .backgroundColor(Color.White)
    .padding(10)
  }
}

@CustomDialog
struct ShowPhone {
  // @link isshowPhone: boolean
  controller: CustomDialogController // 控制器
  showPhone: imageIteminfo = {
    imageurl: 'ResourceStr',
    iscelecat: false,
    id: 0
  }

  build() {
    Column({
      space: 10
    }) {
      Image(this.showPhone.imageurl).width('100%').layoutWeight(1).backgroundColor(Color.White).padding(10)
      // .onClick(this.controller.close())
      // Button('返回').onClick((event: ClickEvent) => {
      //   this.isshowPhone = false
      // }).height(50).width('100%')
    }
    .padding(10)
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
    .zIndex(2)
    .position({
      x: 0,
      y: 0
    })
  }
}

