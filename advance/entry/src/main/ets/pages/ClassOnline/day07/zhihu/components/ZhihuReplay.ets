@Preview
@Component
export struct ZhihuReplay {
  @State message: string = 'Hello World';

  build() {
    Row({
      space: 10
    }) {

      TextInput({
        placeholder: '再此输入评论'
      }).layoutWeight(1)

      Button('发布').onClick((event: ClickEvent) => {

      })

    }.width('100%').padding(10).height(60)

  }
}

