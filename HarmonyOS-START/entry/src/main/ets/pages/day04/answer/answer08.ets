class Information {
  text: string;
  bgcImage: string

  constructor(text: string, bgcImage: string) {
    this.text = text
    this.bgcImage = bgcImage
  }

}

@Entry
@Component
struct Index {@State message: string = 'Hello World';
@State Informations:Information[] = [
  new Information('能够使用padding、margin等属性调整内容之间的间距能够使用层叠布局(Stack)搭建界面结构','app.media.prd_03'),
  new Information('能够使用padding、margin等属性调整内容之间的间距能够使用层叠布局(Stack)搭建界面结构','app.media.prd_02'),
  new Information('能够使用padding、margin等属性调整内容之间的间距能够使用层叠布局(Stack)搭建界面结构','app.media.prd_01')
]
  build() {

    Column(){
      Row(){
        Text('课程').fontSize(20).fontWeight(600)
        Row(){
          Text('更多').fontColor('#999').fontWeight(400)
          Image($r('app.media.ic_arrow_right')).width(20).fillColor("#999")
        }
      }.justifyContent(FlexAlign.SpaceBetween).margin(10).width('100%').padding({
        top:10,
        right:10,
        left:10
      })

      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap
      }) {

        ForEach(this.Informations,(item:Information)=>{
          Column() {
            Stack() {
              Image($r(item.bgcImage)).width(160).borderRadius(10)
              Row() {
                Text('9999人观看')
                  .fontSize(12)
                  .fontColor('#fff').margin({
                  left: 15,
                  right: 15
                })
              }
              .position({
                x: 55,
                y: 10
              })
              .opacity(0.7)
              .borderRadius(10)
              .backgroundColor('#000')
              .height(20)

            }.width(160)

            Text(item.text)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .width('100%')
              .fontSize(14)
              .lineHeight(20)
              .fontColor('#333333')
              .padding(5)
          }.width(160).margin(10)
        })



      }

    }


  }
}

