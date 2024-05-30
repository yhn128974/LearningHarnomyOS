@Entry
@Component
struct Index {

  build() {

    Row() {

      Text('<< 上一页').width('30%').height(40).backgroundColor('#bdc3c7').fontSize(14).textAlign(TextAlign.Center)
      Text('1/805').width('40%').height(40).fontSize(14).textAlign(TextAlign.Center)
      Text('下一页 >>').width('30%').height(40).backgroundColor('#3d7eff').fontSize(14).textAlign(TextAlign.Center)
    }.width('100%')
    .height('100%').padding(10)
  }
}

