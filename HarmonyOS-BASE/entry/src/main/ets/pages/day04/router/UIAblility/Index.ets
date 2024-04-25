import router from '@ohos.router';

let msg: string = '来自index的数据';

class routerParams {
  src: string

  constructor(str: string) {
    this.src = str
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State src: string = '';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('NEXT').onClick(() => {
          router.pushUrl({
            url: 'pages/day04/router/UIAblility/Second',
            params: {
              msg: msg
            }
          }, router.RouterMode.Single,
            err => {
              if (err) {
                console.log(`${err.code}`)
              }
            }
          )
        })
        Text(this.src)
      }
      .width('100%')
    }
    .height('100%')
  }

  onPageShow() {
    this.src = (router.getParams() as routerParams).src
  }
}

