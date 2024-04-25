interface Info {
  message: string
}

@Entry
@Component
struct BiulderParamCase {
  @State info: Info = {
    message: 'Hello, world!'
  }

  @Builder
  SetHeader(info: Info) {
    Text(info.message)
  }

  @Builder
  SetHeader2() {
    Text('标题2')
  }

  @Builder
  SetBoy() {
    Image($r('app.media.10')).width('100%').height(100)
  }

  build() {
    Column({
      space: 10
    }) {
      this.SetHeader({
        message: this.info.message
      })

      HmCard({
        Header: () => {
          this.SetHeader({
            message: this.info.message
          })
        },
        Boy: () => {
          this.SetBoy()
        }
      })

      HmCard({
        Header: () => {
          this.SetHeader2()
        },
        Boy: () => {
          this.SetBoy()
        }
      })

      Button('changeMessage').onClick((event: ClickEvent) => {
        this.info.message = 'message was changed'
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}


@Component
struct HmCard {
  @BuilderParam Header: () => void
  @BuilderParam Boy: () => void

  build() {
    Column() {
      Row() {
        if (this.Header) {
          this.Header()
        }
      }

      Row() {
        if (this.Boy) {
          this.Boy()
        }
      }

      Row({
        space: 10
      }) {
        Button('确定')
        Button('取消')
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .padding(10)
    }

    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}


