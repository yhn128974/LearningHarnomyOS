import {
  AppBreakPoint,
  AppCategory,
  AppSafeArea,
  BreakPointType,
  CategoryItem,
  CategoryItemChild,
  HDMNavBar
} from 'basic'
import { AppStorageV2, promptAction } from '@kit.ArkUI'

@ComponentV2
@Entry
export struct CategoryView {
  //获取断点值
  breakObj: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  //获取避免区域的大小
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  //安全区域
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  //  Mock分类数据
  categories: CategoryItem[] = new Array(10).fill({
    id: "1181622001",
    name: "气质女装",
    picture: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png"
  })
  @Local activeIndex: number = 0
  appCategory = new AppCategory()

  aboutToAppear(): void {
    this.appCategory = AppStorageV2.connect(AppCategory, () => new AppCategory())!
    this.categories = this.appCategory.category
  }

  build() {
    Column() {
      HDMNavBar({
        title: '分类',
        showLeftIcon: false,
        showRightIcon: true,
        rightIcon: $r("[basic].media.ic_public_search"),
        onRightClick: () => {
          promptAction.openToast({
            message: 'hello'
          })
        }
      })

      Row() {
        Column() {

          Repeat<CategoryItem>(this.categories).each((obj) => {
            Text(obj.item.name)// 文本
              .backgroundColor(this.activeIndex === obj.index ? $r('[basic].color.black') : $r('[basic].color.white'))
              .fontSize(14)
              .fontColor(this.activeIndex === obj.index ? $r('[basic].color.white') : $r('[basic].color.black'))
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(56)
              .onClick(() => {
                this.activeIndex = obj.index
              })
          })
        }
        .width(88)
        .border({ width: { right: 0.5 }, color: $r('[basic].color.under') })

        Scroll() {
          Column() {
            // 顶部图片
            Image(this.categories[this.activeIndex].picture)
              .width('100%')
              .height(new BreakPointType({
                sm: 136,
                md: 316,
                lg: 316
              }).getValue(this.breakObj.breakPoint))
              .objectFit(ImageFit.Contain)
              .backgroundColor('#f6f6f6')
              .borderRadius(8)
              .margin({ bottom: 8 })
            GridRow({
              columns: new BreakPointType({
                sm: 2,
                md: 3,
                lg: 4
              })
                .getValue(this.breakObj.breakPoint), gutter: 8

            }) {
              // 子分类
              Repeat<CategoryItemChild>(this.appCategory.category[this.activeIndex]?.children || []).each(obj => {
                GridCol() {
                  Column() {
                    // 图片
                    Image(obj.item.picture)
                      .width(64)
                      .aspectRatio(1)
                    Text('半裙')// 文本
                      .fontSize(14)
                      .fontColor($r('[basic].color.text'))
                      .margin({ top: 8 })
                  }
                  .height('100%')
                  .justifyContent(FlexAlign.Center)
                }
                .aspectRatio(1)
                .backgroundColor('#f6f6f6')
                .borderRadius(8)
              })


            }
          }
          .padding(8)

        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }
      .layoutWeight(1)
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height('100%')

  }
}