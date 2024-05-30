interface infomation {
  imag_url: string,
  title: string,
}

@Entry
@Component
struct Index {
  @State infomations: infomation[] = [
    {
      imag_url: "app.media.list_001",
      title: "飙升榜",

    }, {
    imag_url: "app.media.list_002",
    title: "热哥榜",

  }, {
    imag_url: "app.media.list_002",
    title: "新哥榜",

  }, {
    imag_url: "app.media.list_004",
    title: "流行指数榜",

  }, {
    imag_url: "app.media.list_005",
    title: "腾讯音乐达人榜",

  }, {
    imag_url: "app.media.list_006",
    title: "听歌识曲榜",

  },
  ]

  build() {
    Column() {
      Column() {
        Row() {
          Row() {
            Image($r("app.media.jdlogo")).width(33).margin({
              right: 6
            })
            Column() {
              Text('QQ音乐').fontSize(16).lineHeight(20)
              Text('打开App收藏下载').fontColor('#858585').fontSize(12)
            }.alignItems(HorizontalAlign.Start)
          }


          Text('下载APP')
            .width(86)
            .border({
              color: "#d8d8d8",
              width: 1
            })
            .fontSize(13)
            .width(85)
            .textAlign(TextAlign.Center)
            .padding(6)
            .borderRadius(13)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(14)

        Row() {
          Row() {
            Text('推荐').fontSize(16).fontColor('rgba(26,26,26,0.5)')
          }.layoutWeight(1).justifyContent(FlexAlign.Center)

          Row() {
            Text('排行')
              .border({
                color: {
                  bottom: 'rgb(34,213,156)',

                },
                width: {
                  bottom: 3
                }
              })
              .fontColor('rgb(34,213,156)')
          }.layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .height(42)
        }.width('100%')

      }.width('100%')
      .shadow({
        radius: 10,
        offsetX: 0,
        type: ShadowType.COLOR,
        offsetY: 10,
        color: '#d8d8d8'
      })

      Column() {
        List() {
          ForEach(this.infomations, (item: infomation, idnex: number) => {
            ListItem() {
              Row() {
                Column() {
                  Text(item.title).fontWeight(FontWeight.Bolder).fontSize(16).margin(2)
                  ForEach(['love win all', '相遇的意义', '我还想他阿达大叔大婶'], (item: string, index: number) => {
                    Row() {
                      Text(`${index + 1}.`).fontWeight(800)
                      Text(`${item}`).margin(2)
                    }.justifyContent(FlexAlign.Start)
                  })
                }.layoutWeight(2).alignItems(HorizontalAlign.Start).padding(12)

                Column() {
                  Text('每日更新').fontColor(Color.White).lineHeight(12).fontSize(12).margin(6)
                  Row() {
                    Image($r('app.media.ic_play')).width(12).fillColor(Color.White)
                    Text('1000万').fontColor(Color.White)
                  }.backgroundColor(Color.Black)
                  .padding({
                    left: 10,
                    right: 10
                  })
                  .borderRadius(9)
                  .height(17)
                }
                .layoutWeight(1)
                .backgroundImage($r(item.imag_url))
                .height(107)
                .justifyContent(FlexAlign.SpaceBetween)
                .border({
                  width: 1,
                  style: BorderStyle.Solid
                })
                .backgroundImageSize(ImageSize.Cover)
                .alignItems(HorizontalAlign.End)
                .borderRadius({
                  topRight: 10,
                  bottomRight: 10
                })
              }.borderRadius(10).margin(6).backgroundColor(Color.White)
            }
          })


        }.padding(10)
      }.layoutWeight(1)

      Row() {
        Image($r("app.media.jdlogo")).width(22)
        Text('安装QQ音乐 发现更多精彩').margin({ left: 10, })
      }
      .backgroundColor(Color.White)
      .height(45)
      .borderRadius(23)
      .padding({
        left: 15,
        right: 15,
      })
      .position({
        y: '100%',
        x: '50%'
      })
      .translate({
        y: "-100%-65",
        x: '-50%'
      })

    }.backgroundColor('#fafafa')

  }
}

