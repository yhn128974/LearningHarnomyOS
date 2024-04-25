@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        // Child() //报错 因为被Require修饰的状态是必传的
        Child2()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Require @Prop message:string
  build() {

  }
}

@Component
struct Child2 {
@Prop message:string
  build() {

  }
}