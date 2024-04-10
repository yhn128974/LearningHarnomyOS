import { zhifu, zhifuModel } from '../moduls'

@Preview
@Component
export struct ZhihuReplay {
  @State message: string = '';
  AddItem: (text: string) => void = () => {
  }

  build() {
    Row({
      space: 10
    }) {
      TextInput({
        placeholder: '再此输入评论',
        text: $$this.message
      }).layoutWeight(1).onSubmit(() => {
        // 键盘提交事件
        if (this.message) {
          this.AddItem(this.message)
          this.message = ''
        }
      })

      Button('发布').onClick((event: ClickEvent) => {
        this.AddItem(this.message)
        this.message = ''
      })

    }.width('100%').padding(10).height(60)

  }
}

