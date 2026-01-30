import { AreaHeight, TabBarItem, tabList } from '../models';
import { AppStorageV2 } from '@kit.ArkUI';
//
import { HomePage } from './home';
import { ProjectPage } from './project';
import { InterViewPage } from './interview';
import { MinePage } from './mine';
import { navPathStack } from '../commons/utils';


//Navigation 的使用
//1.准备Navigation组件，包裹主内容
//  (1).AppStorageV2直接存一份二，直接共享
//  (2).单列模型
//2.配置路由表
//3.准备组件
//4.基于全局的路由对象，切换组件


@Entry
@ComponentV2
struct Index {
  @Local currentBarIndex: number = 0
  areaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => new AreaHeight(0, 0))!

  @Builder
  TabBarBuilder(icon: ResourceStr, activeIcon: ResourceStr, name: string, index: number) {
    Column({
      space: 5
    }) {
      Image(this.currentBarIndex === index ? activeIcon : icon).width(24).aspectRatio(1)
      Text(name)
        .fontSize(12)
        .fontColor($r('app.color.black'))
        .fontColor(this.currentBarIndex === index ? $r('app.color.black') : $r('app.color.common_gray_01'))
    }
  }

  build() {
    Navigation(navPathStack) {
      Column() {
        Tabs() {
          ForEach(tabList, (item: TabBarItem, index) => {
            TabContent() {

              if (index === 0) {
                HomePage()
              } else if (index === 1) {
                ProjectPage()
              } else if (index === 2) {
                InterViewPage()
              } else {
                MinePage()
              }

            }.tabBar(this.TabBarBuilder(item.icon, item.activeIcon, item.name, index))
          })
        }
        .padding({
          bottom: this.areaHeight.voidAreaBottomHeight,
          top: this.areaHeight.voidAreaTopHeight
        })
        .onChange((data) => {
          this.currentBarIndex = data
        })
        .barPosition(BarPosition.End)
        .scrollable(false)
        .animationDuration(0)
        .divider({
          strokeWidth: 0.5,
          color: $r('app.color.common_gray_border'),
          startMargin: 20,
          endMargin: 20
        })
      }
      .height('100%')
      .width('100%')
    }.hideTitleBar(true) //隐藏titleBar，不然会影响布局


  }
}

