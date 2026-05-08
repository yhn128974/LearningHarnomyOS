import { HDMNavBar, AppSafeArea, PAGE_PATH } from 'basic'
import { AppStorageV2 } from '@kit.ArkUI'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'

@Preview
@HMRouter({ pageUrl: PAGE_PATH.AI_CUSTOMER_PAGE })
@ComponentV2
export struct AICustomerView {
  @Local inputText: string = ''
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!

  build() {
    Stack() {
      Column() {
        HDMNavBar({
          title: 'DeepSeekAI客服',
          onLeftClick: () => {
            HMRouterMgr.pop()
          }
        })

        Column() {
          Image('https://www.deepseek.com/images/logo.svg')
            .width(100)
            .aspectRatio(1)
            .margin({ top: 32, bottom: 16 })
            .shadow({
              radius: 8,
              color: '#1A73E8',
              offsetY: 4
            })

          Text('DeepSeekAI智能客服')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 12 })
            .fontColor('#1A73E8')

          Text('您好，我是DeepseekAI智能客服助手，有什么可以帮助您的？')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 32 })
            .padding({ left: 24, right: 24 })
            .fontColor('#666666')

          // 客服对话区域
          Column() {
            // 模拟对话气泡
            Row() {
              Text('您好，我想咨询一下商品的退换货政策。')
                .fontSize(15)
                .backgroundColor('#1A73E8')
                .fontColor('#FFFFFF')
                .borderRadius(16)
                .padding({
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 12
                })
                .margin({ right: 50 })
            }
            .width('100%')
            .justifyContent(FlexAlign.End)
            .margin({ bottom: 20 })

            Row() {
              Image($r('app.media.ic_user_service'))
                .width(36)
                .height(36)
                .borderRadius(18)
                .margin({ right: 12 })
                .shadow({
                  radius: 4,
                  color: '#000000',
                  offsetY: 2,
                })

              Text('您好，根据我们的政策，商品在收到后7天内，如有质量问题可申请退换货。非质量问题的退换货需在收到商品后24小时内提出申请。具体可查看商品详情页的售后说明。')
                .fontSize(15)
                .backgroundColor('#F8F9FA')
                .borderRadius(16)
                .padding({
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 12
                })
                .margin({ left: 10, right: 50 })
                .fontColor('#333333')
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
            .margin({ bottom: 20 })
          }
          .width('100%')
          .padding({ left: 20, right: 20 })
          .layoutWeight(1)
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#FFFFFF')
      }
      .width('100%')
      .height('100%')

      // 底部输入框区域
      Column() {
        Divider()
          .color('#F5F5F5')
          .width('100%')
          .strokeWidth(0.5)
          .opacity(0.8)

        Row() {
          TextInput({ text: this.inputText, placeholder: '请输入您的问题...' })
            .layoutWeight(1)
            .height(48)
            .backgroundColor('#F8F9FA')
            .borderRadius(24)
            .padding({ left: 20, right: 20 })
            .fontSize(16)
            .fontColor('#333333')

          Button('发送')
            .height(48)
            .backgroundColor('#1A73E8')
            .borderRadius(24)
            .margin({ left: 8 })
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
        }
        .width('100%')
        .padding({
          left: 16,
          right: 16,
          top: 12,
          bottom: 12
        })
        .backgroundColor('#FFFFFF')
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
      .position({ y: '100%' })
      .translate({ y: -80 })
      .margin({ bottom: this.safeArea.bottomHeight })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}