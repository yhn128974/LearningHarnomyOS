import { AreaHeight, TabBarItem, tabList } from '../models';
import { AppStorageV2 } from '@kit.ArkUI';
//
import { HomePage } from './home';
import { ProjectPage } from './project';
import { InterViewPage } from './interview';
import { MinePage } from './mine';


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
  }
}

