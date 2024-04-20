class Message {
  zh: string = ''
  en: string = ""
}

Environment.envProp('language', 'zh')

@Entry
@Component
struct Environment02 {
  @StorageLink('language') language: string = ''
  welcomeMessage: Message = {
    zh: '您好',
    en: 'welcome！'
  }

  build() {
    Row() {
      Column() {
        Text('根据系统语言决定打招呼的方式' + this.language)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('欢迎App用户').onClick((event: ClickEvent) => {
          if (this.language == 'zh') {
            AlertDialog.show({ message: this.welcomeMessage.zh })
          } else {
            AlertDialog.show(({
              message: this.welcomeMessage.en
            }))
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

