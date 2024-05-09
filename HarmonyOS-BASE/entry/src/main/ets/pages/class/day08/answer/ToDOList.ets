interface titles {
  IsFished: boolean,
  text: String
}

@Entry
@Component
struct Index {
  @State IsFished: boolean = false;
  @State titlesinfo: titles[] = [
    {
      IsFished: false,
      text: 'Arkts学习',
    },
    {
      IsFished: true,
      text: '函数学习',
    },
    {
      IsFished: false,
      text: '鸿蒙学习',
    }
  ]

  build() {
    Column() {
      List({ space: 10 }) {

        ForEach(this.titlesinfo, (item: titles, index) => {

          ListItem() {
            Row() {
              RowTest({ item: item })
            }
          }
          .width('100%')
          .height(50)
          .border({
            width: { left: 3 },
            color: { left: '#75BEDB' }
          })
          .backgroundColor('#F3F9FC')
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding(20)
      .margin({ top: 100 })
      .borderRadius(20)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor(Color.Orange)
  }
}


@Component
struct RowTest {
  @Prop item: titles

  build() {
    Row() {
      Text("" + this.item.text)
        .fontColor(this.item.IsFished ? '#111' : '#999')
        .fontStyle(this.item.IsFished ? FontStyle.Normal : FontStyle.Italic)
        .decoration({
          type: this.item.IsFished ? TextDecorationType.None : TextDecorationType.LineThrough
        })
      Button(this.item.IsFished ? '完成' : '继续')
        .height(30)
        .backgroundColor(this.item.IsFished ? '#327EF6' : '#F3A83C').onClick(() => {
        this.item.IsFished = !this.item.IsFished
        console.log("" + this.item.IsFished);
      })
    }
    .width('100%')
    .padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

