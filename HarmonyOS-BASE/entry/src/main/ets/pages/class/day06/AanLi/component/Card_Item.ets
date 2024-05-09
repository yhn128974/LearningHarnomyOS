interface score_info {
  heat: number,
  score: number,
  CompanyReNum: number,
  price: number,
}

interface items_interface {
  image_url: string,
  title: string,
  score_info: score_info,
  Reason_for_listing: string,
  label: Array<string>,
  address: string,
  distance: number,
}

@Component
export struct CardItem {
  @Prop item: items_interface
  @Prop Index: number;

  build() {
    Row({ space: 8 }) {
      // 图片区域
      Row() {
        Image($r(this.item.image_url)).List_of_popular_attractions_image()
        Text(`No.${this.Index + 1}`).backgroundImage($r('app.media.no_icon')).List_of_popular_attractions_number()
      }

      // 文字区域
      Column({ space: 6 }) {
        // 标题
        Row() {
          Text(this.item.title)
            .List_of_popular_attractions_title()
          Image($r('app.media.ic_xihuan'))
            .width(18).fillColor('#444')
        }
        .width('100%').justifyContent(FlexAlign.SpaceBetween)

        // 评分
        Row({ space: 8 }) {
          Row() {
            Image($r('app.media.ic_huo'))
              .width(10).fillColor('#fff')
            Text("" + this.item.score_info.heat)
              .fontSize(12).fontColor('#fff')
          }.List_of_popular_attractions_score_icon()

          Row({ space: 3 }) {
            Text(`${this.item.score_info.score}分`)
              .fontSize(12).fontColor('#666')
            Text(`${this.item.score_info.CompanyReNum}w条点评`)
              .fontSize(12).fontColor('#666')
          }

          Text(`￥${this.item.score_info.price}起`)
            .fontSize(12).fontColor('#666')
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)

        // 上榜理由
        Row() {
          Row() {
            Image($r('app.media.dianzan'))
              .width(16)
            Text('上榜理由:')
              .fontSize(13).fontWeight(600).fontColor('#5F2B0E')
          }
          .position({ x: 0, y: 1 })

          Text(this.item.Reason_for_listing).List_of_popular_attractions_List_reason_text()
        }
        .padding(8).backgroundColor('#FFF7F1').borderRadius(4)

        // 标签
        Row({ space: 5 }) {
          ForEach([this.item.label], (item: string, index) => {
            Text(item).label_style()
          })
        }.width('100%')

        // 地址
        Row({ space: 5 }) {
          Image($r('app.media.ic_daohangdizhi'))
            .width(11).fillColor('#999')
          Text(this.item.address)
            .fontSize(12).fontColor('#999')
        }
        .width('100%')
      }
      .layoutWeight(1)
    }
    .List_of_popular_attractions_row()
    .alignItems(VerticalAlign.Top)
  }

  @Styles
  List_of_popular_attractions_image(){
    .width(88).height(175).borderRadius(5)
  }

  @Styles
  List_of_popular_attractions_row(){
    .width('100%')
    .padding(12)
    .backgroundColor('#fff')
    .borderRadius(5)
    .shadow({
      radius: 8,
      color: 'rgba(0, 0, 0, 0.1)',
      offsetX: 0,
      offsetY: 2,
      fill: true
    })
  }

  @Styles
  List_of_popular_attractions_score_icon(){
    .padding(4).borderRadius(4)
    .linearGradient({ direction: GradientDirection.Left, colors: [['#FF856E', 0.1], ['#FF902A', 1.0]] })
  }
}

@Extend(Text)
function List_of_popular_attractions_title() {
  .fontSize(16).fontWeight(600).lineHeight(20).fontColor('#000')
}

@Extend(Text)
function label_style() {
  .padding(4)
  .border({ width: 1, color: '#99AECA' })
  .borderRadius(4)
  .fontSize(10)
  .fontColor('#99AECA')
}

@Extend(Text)
function List_of_popular_attractions_List_reason_text() {
  .textIndent(78)
  .fontSize(13)
  .lineHeight(18)
  .textOverflow({ overflow: TextOverflow.Ellipsis })
  .fontColor('#5F2B0E')
  .maxLines(3)
}

@Extend(Text)
function List_of_popular_attractions_number() {
  .width(50)
  .height(28)
  .position({ x: -4 })
  .textAlign(TextAlign.Center)
  .fontSize(11)
  .fontWeight(700)
}


