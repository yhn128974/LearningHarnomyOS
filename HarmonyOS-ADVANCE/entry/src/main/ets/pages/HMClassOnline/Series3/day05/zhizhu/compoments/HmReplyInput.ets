import { ZhiHu, ZhiHuModel } from '../models/zhuhumodel'

@Component
struct HmReplyInput {
  @State
  content: string = ""
  putMessage: (content: string) => void = () => {
  }

  build() {
    Row({ space: 10 }) {
      TextInput({ text: $$this.content, placeholder: '～请留下您的神评论' })
        .layoutWeight(1)
        .height(40)
        .onSubmit(() => {

          this.putMessage(this.content)

        })
      Button("发布").onClick(() => {
        this.putMessage(this.content)
      })
    }
    .padding({ left: 10, right: 10 })
    .width('100%')
    .height(60)
  }
}


export { HmReplyInput }