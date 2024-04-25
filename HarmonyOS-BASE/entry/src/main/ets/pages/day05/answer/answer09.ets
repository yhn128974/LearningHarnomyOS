
interface information {
  imagurl: string,
  text: string
}

@Entry
@Component
struct Index {

  @State titleInformations: information[] = [
    {
      imagurl: 'app.media.list_01',
      text: '能够使用列表布局(List)和层叠布局(Stack)搭建界面结构'
    }, {
    imagurl: 'app.media.list_02',
    text: '能够使用文本属性美化文字'
  },
    {
      imagurl: 'app.media.list_03',
      text: '能够使用列表布局(List)和层叠布局(Stack)搭建界面结构'
    },
    {
      imagurl: 'app.media.list_04',
      text: '博客'
    },
    {
      imagurl: 'app.media.list_05',
      text: '企业培训'
    },
    {
      imagurl: 'app.media.list_06',
      text: '群众'
    }
  ]



  build() {

    Column(){
      Row(){
        Text('编辑推荐').border({
          color: {
            left: '#ca3f32'
          },
          width: {
            left: 2
          },
          style: {
            left: BorderStyle.Solid
          }
        }).width('100%').padding({
          left:5
        }).margin({
          bottom: 10
        }).fontSize(16).fontWeight(600).lineHeight(16)
      }
      List({
        space:3
      }) {
        ForEach(this.titleInformations,(item:information,index)=>{
          ListItem(){
            Column(){
              Stack({
                alignContent:Alignment.TopEnd
              }){
                Image($r(item.imagurl)).width(115)
                Row(){
                  Image($r('app.media.icon_erji')).width(16).fillColor(Color.White)
                  Text('2684.2万').fontSize(12).lineHeight(12).fontColor(Color.White)
                }.padding(5)
              }
              Text(item.text).fontSize(14).lineHeight(14).maxLines(2).textOverflow({
                overflow:TextOverflow.Ellipsis
              }).width(115).padding(5).fontColor('#333')
            }
          }
        })
      }
      .listDirection(Axis.Horizontal).lanes(2).scrollBar(BarState.Off)
    }.height(350).margin(10)


    }


}

