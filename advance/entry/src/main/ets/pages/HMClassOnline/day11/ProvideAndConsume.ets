@Entry
@Component
struct ProvideCase02 {
  @Provide('numbers') count: number = 0

  build() {
    Row() {
      Column({ space: 15 }) {
        Text(this.count.toString())
          .fontSize(50)
        Button("顶级组件+1")
          .onClick(() => {
            this.count++
          })
        Divider()
        Child()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  build() {
    Column() {
      Text("子组件")
        .fontSize(40)
      Divider()
      Grand()
    }
  }
}

@Component
struct Grand {
  // Consume 别名用法
  // Consume 自己没有初始值
  // @Consume('numbers') numbers: number

  @Consume count: number

  build() {
    Column() {
      Text("孙组件")
        .fontSize(30)
      Text(this.count.toString())
      Button("3级组件+1")
        .onClick(() => {
          this.count++
        })
    }
  }
}