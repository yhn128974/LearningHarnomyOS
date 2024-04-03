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
  @State maritalStatus: string = "单身"
  @State inputText: string = ''

  build() {
    Grid() {

      GridItem() {
        Column() {
          Text(this.Alice.ISMarry ? "已婚人事" : "单身贵族")
          Checkbox()
          // 复杂类型双向绑定可以用但是报错
          // .select($$this.Alice.ISMarry)
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

      GridItem() {
        Column() {
          Text(this.maritalStatus)
          Row() {
            Text('单身')
            Radio({ value: '单生', group: "RadioGroup" }).checked(true).onChange((isChecked: boolean) => {
              if (isChecked) {
                this.maritalStatus = '单身'
              }
            })
            Text('已婚')
            Radio({ value: '已婚', group: "RadioGroup" }).checked(false).onChange((isChecked: boolean) => {
              if (isChecked) {
                this.maritalStatus = '已婚'
              }
            })
          }
        }

      }.height(200).backgroundColor(Color.Pink)

      GridItem() {
        Column() {
          Text(this.inputText)
          TextArea({ text: $$this.inputText }).maxLength(5)
          TextInput({ text: $$this.inputText })
        }
      }.height(200).backgroundColor(Color.Pink)

      GridItem() {
        Column() {
        PatternLock()
        }
      }.height(200).backgroundColor(Color.Pink)

    }.columnsGap(10).columnsTemplate('1fr 1fr ').rowsGap(10)
  }
}