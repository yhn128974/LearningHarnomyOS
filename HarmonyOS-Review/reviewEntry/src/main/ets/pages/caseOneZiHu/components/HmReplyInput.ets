import { ReplyItem, ReplyItemModel } from "../data"
import { promptAction } from "@kit.ArkUI"

@ComponentV2
struct HmReplyInput {
  @Param lastId: number = 0;
  @Local
  content: string = ""
  @Event pushComment: (content: string) => void = () => {
  }

  build() {
    Row({ space: 10 }) {
      TextInput({ text: $$this.content, placeholder: '～请留下您的神评论' })
        .layoutWeight(1)
        .height(40)
        .onChange((value) => {
          this.content = value
        })
      Button("发布").onClick(() => {

        if (this.content == '') {
          promptAction.showToast({
            message: "请输入评论内容"
          })
        } else {
          this.pushComment(this.content)

        }
      }).enabled(this.content == '' ? false : true)
    }
    .padding({ left: 10, right: 10 })
    .width('100%')
    .height(60)
  }
}

export { HmReplyInput }