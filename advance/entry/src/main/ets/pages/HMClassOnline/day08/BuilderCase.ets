@Entry
@Component
struct BuilderCase {
  @State message: string = 'Hello World';

  changeMessage(newMessage: string) {
    this.message = newMessage
  }

  @Builder
  getItemBulder() {
    // builder内部不能定义变量
    // let message: string = 'Hello World';
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
  }

  build() {
    Column() {
      this.getItemBulder()
      BuilderFunction({
        putMessage: (message: string) => {
          this.changeMessage(message)
        }
      })

    }
    .height('100%')
  }
}


@Component
struct BuilderFunction {
  @State message: string = 'Hello There!'
  putMessage: (message: string) => void = () => {
  }

  build() {
    Button('put children message').onClick((event: ClickEvent) => {
      this.putMessage(this.message)
    })
  }
}

