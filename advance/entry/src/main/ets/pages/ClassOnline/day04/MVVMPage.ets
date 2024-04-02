class Person {
  ISMarry = false;
}

@Entry
@Component
struct MVVMPage {
  @State message: string = 'Hello World';
  @State Alice: Person = {
    ISMarry: false
  }
  @State SearchText: string = ''

  build() {
    Grid() {

      GridItem() {
        Column() {
          Text(this.Alice.ISMarry ? "已婚人事" : "单身贵族")
          Checkbox()
            .select($$this.Alice.ISMarry)
        }
      }.height(200).backgroundColor(Color.Pink)

      GridItem() {
        Column() {
          Text(this.SearchText)
          Search({
            value: $$this.SearchText
          })

        }
      }.height(200).backgroundColor(Color.Pink)

    }.columnsGap(10).columnsTemplate('1fr 1fr ')
  }
}