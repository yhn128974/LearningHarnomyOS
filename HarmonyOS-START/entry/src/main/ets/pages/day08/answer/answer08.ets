@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
@State buttontest: string = '+关注'
  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_jiantou')).width(20).fillColor(Color.White).margin({
          left: 20,
          right: 10
        })
        Row() {
          Image($r('app.media.avatar001')).width(24).borderRadius(12)
          Text('大V在现场').fontColor(Color.White).fontSize(14).margin({
            left: 10,
            right: 10
          })
          Button(this.buttontest).onClick((event: ClickEvent) => {

          }).backgroundColor('#f92b13').linearGradient({
            angle: 90,
            colors: [['#f92b13', 1], ['#e90009', 1]]
          }).onClick(()=>{
            this.buttontest='已关注'
          })
        }
        .height(30)
        .backgroundColor('#202020')
        .opacity(0.7)
        .borderRadius(15)
        .padding(3)

        Row() {
          Image($r('app.media.ic_ball')).width(20).margin({
            left: 5,
            right: 5,
          })
          Text('更多直播').fontSize(14).margin({
            right: 10
          }).fontColor(Color.White)
        }
        .backgroundColor('#1c1c1c')
        .opacity(0.7)
        .borderRadius({
          topLeft: 15,
          bottomLeft: 15
        })
        .position({
          x: '100%'
        })
        .translate({
          x: "-100%",
          y: 20
        })
        .height(22)
      }.width('100%').height(60).backgroundColor("#2e2e2e")
    }
  }
}

