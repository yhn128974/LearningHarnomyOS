// xxx.ets
class ContactContent {
  initial: string = ''
  nameList: string[] = []
}

@Entry
@Component
struct ModalTransitionExample {
  @State isShow: boolean = false

  build() {
    Column() {
      Image($r('app.media.ic_01_1'))
        .onClick(() => this.isShow = true)
        .bindContentCover(this.isShow, this.CityContentBuilder())
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  @Builder
  CityContentBuilder() {
    Column() {
      // 顶部区域
      this.CityTopBuilder()

      // 底部区域
      this.CityBottomBuilder()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  @Builder
  CityTopBuilder() {
    // 顶部区域
    Row({ space: 20 }) {
      Image('/common/day01_03/05.bindContentCover/ic_public_cancel.svg')
        .width(25)
        .onClick(() => {
          this.isShow = false
        })
      Stack({ alignContent: Alignment.Start }) {
        TextInput({ placeholder: '请输入城市名称' })
          .backgroundColor(Color.White)
          .borderRadius(5)
          .border({ width: .5, color: Color.Gray })
          .padding({ left: 30 })
        Image('/common/day01_03/05.bindContentCover/ic_public_search.svg')
          .width(20)
          .fillColor(Color.Gray)
          .offset({ x: 10 })
      }
      .layoutWeight(1)
    }
    .padding(10)
    .width('100%')
    .height(70)
  }

  @Builder
  CityBottomBuilder() {
    // 顶部区域
    // 底部区域
    Column() {
      List() {
        ListItemGroup({ header: this.itemHead('A'),space:20 }) {
          // 循环渲染分组A的ListItem
          this.contactBuilder('艾佳')
          this.contactBuilder('安安')
          this.contactBuilder('艾米丽')
        }
        .divider({
         startMargin:50,
          endMargin:10,
          strokeWidth: 1,
          color:"#ccc"
        })

        ListItemGroup({ header: this.itemHead('B'),space:20 }) {
          // 循环渲染分组B的ListItem
          this.contactBuilder('白客')
          this.contactBuilder('白夜')
          this.contactBuilder('博明')
        }
        .divider({
          startMargin: 60,
          strokeWidth: 1,
          color: '#ccc'
        })
    }
    .layoutWeight(1)
    .width('100%')
    .backgroundColor(Color.Blue)
  }
}
  @Builder
  itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @Builder
  contactBuilder(name: string) {
    ListItem() {
      Row({ space: 10 }) {
        Image('/common/day01_03/06.List/ic_public_lianxiren.svg')
          .width(40)
          .fillColor('#e4b99a')
        Text(name)
      }
    }
  }

}

