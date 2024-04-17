@Entry
@Component
struct Index {
  @State message: number = 0

  build() {
    Column() {
      Text(this.message.toString())
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message++
        })
      Divider()
      Children({
        // Link的修饰传值在这一代 放宽了 不写$value 用this。value调用也可以实现双向绑定
        message: this.message
      })

    }
    .width('100%')
  }
}

@Component
struct Children {
  @Link message: number

  build() {
    Column() {
      Text(this.message.toString())
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message++
        })

      Swiper() {
        ForEach([0, 1, 2, 3, 4, 5, 6], (item: number) => {
          Row() {
            Text(item.toString())
              .fontSize(50)
              .width('100%')
          }
        })
      }.index($$this.message)

      TextInput({
        placeholder: 'put in',
        text: $$this.message
      })

    }.width('100%')

  }
}

