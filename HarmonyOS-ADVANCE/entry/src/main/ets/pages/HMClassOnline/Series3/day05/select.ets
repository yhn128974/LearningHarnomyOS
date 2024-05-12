@Entry
@Component
struct ConditionCase02 {
  @State myVip: number = 0;
  @State optionValue:string = '暂不开通'
aboutToDisappear(): void {
}
  build() {

    Row() {
      Column({space:20}) {
        Row(){
          Text('开通会员:')
          Select([{value:'暂不开通'},{value:'VIP'},{value:'SVIP'}])
            .width('50%')
            .selected($$this.myVip)
            .value($$this.optionValue)
        }
        Row({ space: 20 }) {
          Image($r('app.media.img')).width(30).borderRadius(30)
          Text('西北吴彦祖')
          if (this.myVip === 0) {
            Text('VIP')
              .VIPStyle('#ccc')

          } else if (this.myVip === 1) {
            Text('VIP')
              .VIPStyle('#ffffb803')

          } else if (this.myVip === 2) {
            Text('SVIP')
              .VIPStyle('#ffb00909')

          }


        }.width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}
@Extend(Text)
function VIPStyle(bgc:string) {
  .padding({
    left: 12,
    right: 12,
    bottom: 4,
    top: 4
  })
  .fontColor('#fff')
  .borderRadius(20)
  .fontSize(12)
  .backgroundColor(bgc)
}