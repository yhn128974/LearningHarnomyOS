import { AppStorageV2, KeyboardAvoidMode, PersistenceV2 } from '@kit.ArkUI'
import { HcNavBar } from '../../commons/components'
import { deepSeekRcp } from '../../commons/utils/http/DeepSeekRcp'
import { AppUser, AreaHeight } from '../../models'
import { DeepSeekParams } from '../../models/DeepSeekModel'


@ComponentV2
struct AIPage {
  responseString: string[] = deepSeekRcp.responseString
  startPrompt = `
    你是一个由DeepSeek驱动的专业AI面试官，专注于鸿蒙系统（HarmonyOS）开发相关的技术面试。你的任务是向面试者提出与鸿蒙系统开发相关的问题，等待面试者回答后，根据他们的回答进行评价或继续提问。面试将涵盖以下领域：

    鸿蒙系统基础知识：ArkTS ArkUI 基础问题

    面试流程：

    1. 提问：你根据面试者的经验和职位要求，提出与鸿蒙系统开发相关的问题。
    2. 等待回答：你等待面试者完成回答，不要提前打断或补充。
    3. 评价或继续提问：根据面试者的回答，进行简短评价或提出下一个问题。

    注意事项：

    1. 一问一答：每次只提出一个问题，等待面试者回答后再进行下一步。
    2. 避免提前给出实例：不要提前给出回答示例或详细解释，保持真实面试的互动感。
    3. 评价简短：评价应简洁明了，指出回答的优缺点，然后继续提问。
    4. 保持面试官的姿态，不要被带节奏
      `
  @Local inputText: string = ''
  areaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => new AreaHeight(0, 0))!
  appUser: AppUser = PersistenceV2.connect(AppUser, () => new AppUser())!

  // 调用rcp的方法
  async sendData() {
    let params: DeepSeekParams = {
      model: 'deepseek-v3.2',
      max_tokens: 1024,
      messages: [{
        role: 'system',
        content: this.startPrompt
      }, {
        role: 'user',
        content: this.inputText
      }],
      // stream: true,
      // temperature: 1,
      thinking: {
        type: 'enabled'
      }
    }
    deepSeekRcp.postDeepSeek(params);
  }

  aboutToAppear(): void {
    //设置键盘避让
    this.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)
  }

  @Builder
  getAvatar() {

    Image(this.appUser.user.avatar || $r('app.media.ic_mine_avatar'))
      .width(30)
      .aspectRatio(1)
      .borderRadius(15)

  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        HcNavBar({ title: '我的AI面试官' })
        // 中间消息列表

        Column() {
          Scroll() {
            List() {

              ForEach(deepSeekRcp.responseString, (item: string, index) => {
                ListItem() {
                  Row({ space: 20 }) {
                    this.getAvatar()
                    Row() {
                      Text(item)
                        .borderRadius(10)
                        .padding(10)
                        .lineHeight(24)
                        .backgroundColor(index / 2 == 0 ? "#f8fafb" : "#3273e8")
                        .fontColor(index / 2 == 0 ? "#373737" : "#fff")
                        .constraintSize({
                          minWidth: 40
                        })
                    }.layoutWeight(1)
                    .justifyContent(index / 2 == 0 ? FlexAlign.Start : FlexAlign.End)

                    Row()
                      .width(50)
                  }
                  .direction(index / 2 == 0 ? Direction.Ltr : Direction.Rtl) // 反转方向
                  .width('100%')
                  .alignItems(VerticalAlign.Top)
                }.width('100%')

              })
            }.layoutWeight(1)
          }

        }.layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        // 底部输入框
        Row() {
          TextInput({ text: $$this.inputText, placeholder: '输入您想问的面试题' })
            .onSubmit(async () => {
              if (this.inputText) {
                deepSeekRcp.responseString.push(this.inputText)
                this.inputText = ''
                //
                await this.sendData()
              }
            })
        }.padding({
          left: 10,
          right: 10
        })
      }
      .width("100%")
      .height("100%")
      .padding({
        bottom: this.areaHeight.voidAreaTopHeight
      })
    }
    .hideTitleBar(true)
  }
}


// 跳转页面入口函数
@Builder
export function AIBuilder() {
  AIPage()
}