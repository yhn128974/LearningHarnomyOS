import { AppSafeArea, AppUser, HDMGuessGoods, HDMNavCol, PAGE_PATH } from "basic"
import { AppStorageV2, PersistenceV2 } from "@kit.ArkUI"
import { HMRouterMgr } from "@hadss/hmrouter"


@Entry
@ComponentV2
export struct MyView {
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  // appUser: AppUser = AppStorageV2.connect(AppUser, () => new AppUser())!

  appUser: AppUser = PersistenceV2.connect(AppUser, () => new AppUser())!

  build() {
    Column() {
      Scroll() {
        Column() {
          // header
          Column() {
            Row() {
              Blank()
              if (this.appUser.user.token) {
                Image($r('[basic].media.ic_public_settings'))
                  .width(24)
                  .aspectRatio(1)
                  .onClick(() => {
                    HMRouterMgr.push({
                      pageUrl: PAGE_PATH.SETTING_PAGE
                    })
                  })
              }


            }
            .width('100%')
            .height(50)

            Row({ space: 16 }) {
              // 头像
              Image(this.appUser.user.avatar ?? $r('app.media.ic_user_avatar'))
                .width(40)
                .aspectRatio(1)
                .borderRadius(20)
              if (this.appUser.user.token) {
                Text(this.appUser.user.nickname)
                  .fontColor($r('[basic].color.black'))
                  .fontWeight(500)
              } else {

                Text('立即登录')
                  .fontColor($r('[basic].color.black'))
                  .fontWeight(500)
                  .onClick(() => {
                    HMRouterMgr.push({
                      pageUrl: PAGE_PATH.LOGIN_PAGE
                    })
                  })
              }
            }
            .width('100%')
            .height(72)

            Row({ space: 8 }) {
              Image($r('app.media.ic_user_vip'))
                .width(24)
                .aspectRatio(1)
              Text('升级美蔻商城会员，尊享无限免邮')
                .fontSize(12)
                .fontColor('#7E2C1A')
                .layoutWeight(1)
              Button('立即开通')
                .width(64)
                .height(24)
                .fontSize(10)
                .padding(0)
                .backgroundColor('#7E2C1A')
            }
            .padding({ left: 8, right: 8 })
            .width('100%')
            .height(40)
            .borderRadius({ topLeft: 10, topRight: 10 })
            .linearGradient({
              angle: 110,
              colors: [['#F9D8AB', 0], ['#F9E3CC', 1]]
            })

          }
          .padding({ left: 16, right: 16, top: this.safeArea.topHeight })
          .linearGradient({
            angle: 180,
            colors: [['#FFF1E5', 0], [$r('[basic].color.under'), 1]]
          })

          // nav
          Column({ space: 8 }) {
            GridRow({ columns: 3 }) {
              GridCol() {
                HDMNavCol({ icon: $r('app.media.ic_user_collect'), text: '我的收藏', color: $r('[basic].color.text') })
              }

              GridCol() {
                HDMNavCol({ icon: $r('app.media.ic_user_history'), text: '我的足迹', color: $r('[basic].color.text') })
                  .onClick(() => {

                  })
              }

              GridCol() {
                HDMNavCol({ icon: $r('app.media.ic_user_service'), text: '我的客服', color: $r('[basic].color.text') })
                  .onClick(() => {
                    HMRouterMgr.push({
                      pageUrl: PAGE_PATH.AI_CUSTOMER_PAGE
                    })
                  })
              }
            }
            .width('100%')
            .linearGradient({
              angle: 180,
              colors: [['#FFF1E5', 0], [$r('[basic].color.white'), 0.15], [$r('[basic].color.white'), 1]]
            })
            .borderRadius(10)

            Column() {
              Text('我的订单')
                .fontSize(14)
                .width('100%')
                .padding({ left: 8, top: 8 })
                .lineHeight(22)
                .fontWeight(500)
                .fontColor($r('[basic].color.black'))
              GridRow({ columns: 5 }) {
                GridCol() {
                  HDMNavCol({ icon: $r('app.media.ic_user_order'), text: '全部订单' })
                    .onClick(() => {
                      // TODO 订单页，无参数
                    })
                }

                GridCol() {
                  HDMNavCol({ icon: $r('app.media.ic_user_obligation'), text: '待付款' })
                    .onClick(() => {
                      // TODO 订单页，无参数 orderState=1
                    })
                }

                GridCol() {
                  HDMNavCol({ icon: $r('app.media.ic_user_unreceived'), text: '待发货' })
                    .onClick(() => {
                      // TODO 订单页，无参数 orderState=2
                    })
                }

                GridCol() {
                  HDMNavCol({ icon: $r('app.media.ic_user_unshipped'), text: '待收货' })
                    .onClick(() => {
                      // TODO 订单页，无参数 orderState=3
                    })
                }

                GridCol() {
                  HDMNavCol({ icon: $r('app.media.ic_user_unevaluated'), text: '待评价' })
                    .onClick(() => {
                      // TODO 订单页，无参数 orderState=4
                    })
                }
              }
              .width('100%')
            }
            .backgroundColor($r('[basic].color.white'))
            .borderRadius(10)
          }
          .padding({ left: 8, right: 8 })

          // guess
          HDMGuessGoods()

        }
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('[basic].color.under'))
  }
}

