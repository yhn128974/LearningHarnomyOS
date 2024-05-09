//
// import {fillScreen,priceTextStyle} from './style'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  // 局部自定义构造函数
  @Builder
  ItemCardInner(title: string) {
    Row() {
      Text(title)
    }.height(300).padding(10)
  }

  // 局部自定义样式
  @Styles
  fillScreen2() {
    .width('100%')
    .border({
      width: 1,
      style: BorderStyle.Solid
    })
    .backgroundColor('#ddd')
    .height(300)
    .padding(10)
    .margin(10)
  }

  // page
  build() {
    Row() {
      Column() {
        Header({ title: '商品列表' })
        //
        List({
          space: 10
        }) {
          ForEach([1, 2, 3, 4], (index: number) => {
            ListItem() {
              ItemCard('listItem')
            }
          })
        }.listDirection(Axis.Vertical).width('100%').layoutWeight(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 自定义组件
@Component
export struct Header {
  @Prop title: string = 'HEADER'

  build() {
    Row() {
      Text(this.title).height(30).fontSize(30).textAlign(TextAlign.Start).width('100%')
    }.border({
      width: 1,
      style: BorderStyle.Solid
    })
  }
}

// 外部自定义构建函数
@Builder
function ItemCard(title: string) {
  Row() {
    Text(title).priceTextStyle()
  }.fillScreen()
}

// 全局公共自定义样式
@Styles
function fillScreen() {
  .width('100%')
  .border({
    width: 1,
    style: BorderStyle.Solid
  })
  .backgroundColor('#ddd')
  .height(300)
  .padding(10)
  .margin(10)
}

// 特定扩展样式 不能定义子在组件内部
@Extend(Text)
function priceTextStyle() {
  .fontSize(30).fontColor('#F36')
  .fontSize(18)
}



