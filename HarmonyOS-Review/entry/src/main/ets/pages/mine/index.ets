import { HcClockIn } from '../../commons/components'
import { AppStorageV2, router } from '@kit.ArkUI'
import { AreaHeight, UserModel } from '../../models'
import { statusBar } from '../../commons/utils/StatusBar'
import { formatTime, fullScreenController, navPathStack } from '../../commons/utils'
import { author } from '../../commons/utils/Author'
import { requestClockIn } from '../../commons/utils/clockIn'

interface Nav {
  icon: ResourceStr
  name: string
  onClick?: () => void
  other?: string
}

interface Tool {
  icon: ResourceStr
  name: string
  value?: string
  onClick?: () => void
}

@ComponentV2
export struct MinePage {
  //
  areaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => {
    return new AreaHeight(0, 0)
  })!
  //
  currentUser: UserModel = author.getUserInfo()

  @Builder
  navBuilder(nav: Nav) {
    GridCol() {
      Column() {
        Image(nav.icon)
          .width(30)
          .aspectRatio(1)
          .margin({ bottom: 10 })
        Text(nav.name)
          .fontSize(14)
          .fontColor($r('app.color.common_gray_03'))
          .margin({ bottom: 4 })
        if (nav.other) {
          Row() {
            Text(nav.other)
              .fontSize(12)
              .fontColor($r('app.color.common_gray_01'))
            Image($r('sys.media.ohos_ic_public_arrow_right'))
              .width(12)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_01'))
          }
        }
      }
      .onClick(() => {
        nav.onClick && nav.onClick()
      })
    }
  }

  @Builder
  toolsBuilder(tool: Tool) {
    Row() {
      Image(tool.icon)
        .width(16)
        .aspectRatio(1)
        .margin({ right: 12 })
      Text(tool.name)
        .fontSize(14)
      Blank()
      if (tool.value) {
        Text(tool.value)
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
      }
      Image($r('sys.media.ohos_ic_public_arrow_right'))
        .width(16)
        .aspectRatio(1)
        .fillColor($r('app.color.common_gray_01'))
    }
    .height(50)
    .width('100%')
    .padding({ left: 16, right: 10 })
    .onClick(() => {
      tool.onClick && tool.onClick()
    })
  }

  build() {
    Column({ space: 16 }) {
      //
      Row({ space: 12 }) {
        Image(this.currentUser.avatar ?? $r('app.media.ic_mine_avatar'))
          .alt($r('app.media.ic_mine_avatar'))
          .width(55)
          .aspectRatio(1)
          .borderRadius(55)
        // 是否登录
        if (this.currentUser.token) {
          Column({ space: 4 }) {
            Text(this.currentUser.nickName || this.currentUser.username)
              .fontSize(18)
              .fontWeight(500)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Row({ space: 4 }) {
              Text('编辑信息')
                .fontSize(12)
                .fontColor($r('app.color.common_gray_01'))
              Image($r('app.media.ic_mine_edit'))
                .width(12)
                .aspectRatio(1)
                .fillColor($r('app.color.common_gray_01'))
            }
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        } else {
          Text('立即登录')
            .fontSize(18)
            .fontWeight(500)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)
            .onClick(() => {
              // router.pushUrl({ url: 'pages/LoginPage' })
              navPathStack.pushPath({
                name: "LoginPage"
              })
            })
        }

        //打卡组件
        HcClockIn({ clockInCount: this.currentUser.clockinNumbers })
          .onClick(() => {
            requestClockIn()
          })

      }
      .width('100%')
      .height(100)
      .margin({ top: this.areaHeight.voidAreaTopHeight })

      //
      GridRow({ columns: 4 }) {
        this.navBuilder({
          icon: $r('app.media.ic_mine_history'), name: '历史记录', onClick: () => {
            // TODO
          }
        })
        this.navBuilder({
          icon: $r('app.media.ic_mine_collect'), name: '我的收藏', onClick: () => {
            // TODO
          }
        })
        this.navBuilder({
          icon: $r('app.media.ic_mine_like'), name: '我的点赞', onClick: () => {
            // TODO
          }
        })
        this.navBuilder({
          icon: $r('app.media.ic_mine_study'),
          name: '累计学时',
          other: formatTime(this.currentUser.totalTime),
          onClick: () => {
            // TODO
          }
        })
      }
      .backgroundColor($r('app.color.white'))
      .padding(16)
      .borderRadius(8)

      //
      Column() {
        this.toolsBuilder({
          icon: $r('app.media.ic_mine_notes'), name: '开发常用词', onClick: () => {
            // TODO
            author.checkAuth({
              name: "WordPage",

            })
          }
        })
        
        this.toolsBuilder({
          icon: $r('app.media.ic_mine_ai'), name: '面通AI',
          onClick: () => {
            author.checkAuth({
              name: "AIPage"
            })
          }
        })


        this.toolsBuilder({
          icon: $r('app.media.ic_mine_invite'), name: '面试录音',
          onClick: () => {
            author.checkAuth({
              name: "AudioPage"
            })
          }
        })

        this.toolsBuilder({ icon: $r('app.media.ic_mine_file'), name: '意见反馈' })
        this.toolsBuilder({ icon: $r('app.media.ic_mine_info'), name: '关于我们' })
        this.toolsBuilder({
          icon: $r('app.media.ic_mine_setting'), name: '设置', onClick: () => {
            // TODO
          }
        })
      }
      .backgroundColor($r('app.color.white'))
      .borderRadius(8)

      Button('退出登录').onClick(() => {
        author.setUserInfo({} as UserModel)
        navPathStack.pushPath({
          name: "LoginPage"
        })
      }).width('90%').height(40)

      Button('修改token').onClick(() => {
        author.getUserInfo().token = 'xxxxxxx'
      }).width('90%').height(40)
    }
    .padding(16)
    .backgroundColor($r('app.color.common_gray_bg'))
    .linearGradient({
      colors: [['#FFB071', 0], [$r('app.color.common_gray_bg'), 0.3], [$r('app.color.common_gray_bg'), 1]]
    })
    .width('100%')
    .height('100%')
    .onVisibleAreaChange([0, 1], (isExpanding, Ratio) => {
      if (isExpanding) {
        // 可视区域变大
        statusBar.setLightBar()
      } else {
        statusBar.setDarkBar()
      }
    })
  }
}