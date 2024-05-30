
import  { CardItem } from './component/Card_Item';

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

let items: items_interface[] = [
  {
    image_url: 'app.media.test001',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },
  {
    image_url: 'app.media.test002',
    title: '故宫博物院',
    score_info: {
      heat: 10,
      score: 4.8,
      CompanyReNum: 14.6,
      price: 308,
    },
    Reason_for_listing: '城墙建筑，院落布局，屋脊小兽，都包含着古代人民的巧夺天工，带小朋友穿梭明清时空',
    label: ['探秘展馆', '文化古迹', '博物馆', '场馆展馆'],
    address: '北京 · 天安门/王府井 ',
    distance: 16.5
  },
  {
    image_url: 'app.media.test003',
    title: '八达岭长城',
    score_info: {
      heat: 9.8,
      score: 4.5,
      CompanyReNum: 3.7,
      price: 35,
    },
    Reason_for_listing: ' 中国古代伟大的防御工程，适合带小朋友领略奇骏险要的地势和长城磅礴恢弘的风采 ',
    label: ['文化古迹'],
    address: ' 北京 · 延庆休闲度假区 ',
    distance: 43.1
  },

  {
    image_url: 'app.media.test004',
    title: '颐和园',
    score_info: {
      heat: 9.0,
      score: 4.7,
      CompanyReNum: 4.0,
      price: 20,
    },
    Reason_for_listing: '原是清朝帝王的行宫和花园，是我国现存规模非常大，保存非常完整的皇家园林 ',
    label: ['遛娃宝藏地', '园林花园', '文化古迹'],
    address: '北京 · 中关村/五道口 ',
    distance: 8.8
  },

  {
    image_url: 'app.media.test005',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },

  {
    image_url: 'app.media.test006',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },

  {
    image_url: 'app.media.test007',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },

  {
    image_url: 'app.media.test009',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },
  {
    image_url: 'app.media.test010',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },

  {
    image_url: 'app.media.test0011',
    title: '北京环球度假区',
    score_info: {
      heat: 10,
      score: 4.5,
      CompanyReNum: 1.8,
      price: 308,
    },
    Reason_for_listing: '这个冬天来环球影城，一起沉浸在冬日独有的浪漫，漫步在雪花飞舞的雪天，创造专属仪式感',
    label: ['嗨玩乐园', '游乐园'],
    address: '北京 · 果园环岛/通州区 距您36.7km',
    distance: 36.7
  },

]


@Entry
@Component
struct Index {
  build() {
    Column() {
      // 区域一：banner
      Column() {
        // 口碑榜logo
        Image($r('app.media.log')).width(200).offset({ y: 70 })

        // 评选规则
        Text('评选规则').Selection_rules()

        // 推荐榜单
        List() {
          ForEach(['app.media.rank', 'app.media.hot', 'app.media.scenery', 'app.media.ski'], (item: string, index) => {
            ListItem() {
              Column() {
                Image($r(item))
                  .width('34%')
              }
            }
          })
        }.listDirection(Axis.Horizontal).position({ y: 160 }).height(82).scrollBar(BarState.Off)

        // 底部 line
        Image($r('app.media.banner_line')).width(359.83).position({ x: 0, y: '100%' }).translate({ y: '-100%' })

      }.width('100%').height(266.97).backgroundImage($r("app.media.banner"))

      // 区域二：选择城市和目的地
      Row() {
        Row({ space: 5 }) {
          Text('北京')
            .fontColor('#5F2B0E').fontSize(16).fontWeight(600)
          Image($r('app.media.ic_public_arrow_down_0'))
            .width(12)
            .height(12)
            .backgroundColor('#5F2B0E')
            .borderRadius(8)
            .fillColor('#fff')
        }
        .width(163)
        .height(36)
        .linearGradient({
          angle: 90,
          // direction: GradientDirection.Right,
          colors: [['rgba(255, 226, 200, 1)', 0.0], ['rgba(230, 175, 138, 1)', 0.5]]
        })
        .borderRadius(16)
        .justifyContent(FlexAlign.Center)

        Row() {
          Text('口碑目的地').fontColor('#99532E').fontSize(16).fontWeight(500)
        }
        .width(163)
        .height(36)
        .backgroundColor('rgba(248, 213, 184, 0.2)')
        .borderRadius(16)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 24, bottom: 24 })
      .padding({ left: 12, right: 12 })

      // 区域三：商业选项菜单
      Row() {
        ForEach(['酒店', '景点', '夜游', '美食'], (item: string, index: number) => {
          if (item == '景点') {
            Text(item).Business_ptionsz_menu().default_linearGradient().fontColor(Color.White)
          } else {
            Text(item).Business_ptionsz_menu()

          }
        })

      }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({ left: 12, right: 12 })

      // 热门
      Row({ space: 35 }) {
        // 标题
        Row({ space: 3 }) {
          Image($r('app.media.ic_hot'))
            .width(17).height(17)
            .fillColor('#CC9466')
          Text('近期热门')
            .fontColor('#673915').fontSize(14).fontWeight(600)
        }
        .margin({ top: 15, bottom: 15 })
        .backgroundImage($r('app.media.select'))
        .backgroundImagePosition(Alignment.Bottom)

        // 选项
        Row() {
          ForEach(['必打卡', '滑雪', '亲子', '自然风光'], (item: string, index) => {
            Text(item).fontSize(14).fontColor('#6666').lineHeight(18).fontFamily('PingFang SC')
          })

        }.layoutWeight(1).justifyContent(FlexAlign.SpaceBetween)
      }.width('100%').padding({ left: 12, right: 12 })

      // 分界字体
      Text('北京近期热门景点榜').fontSize(24).fontWeight(600).fontColor('#3d1a07').lineHeight(34)

      // 热门景点列表
      List() {
        ForEach(items, (item: items_interface, index: number) => {
          ListItem() {
            CardItem({item:item,Index:index})
          }.List_of_popular_attractions()
        })
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
  }

  @Styles
  List_of_popular_attractions(){
    .padding({ left: 12, right: 12, top: 6, bottom: 6 })
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
  default_linearGradient(){
    .linearGradient({ direction: GradientDirection.Right, colors: [['#CC9466', 0.0], ['#B36D3E', 1.0]] })
    .linearGradient({ direction: GradientDirection.Right, colors: [['#CC9466', 0.0], ['#B36D3E', 1.0]] })
  }

  @Styles
  List_of_popular_attractions_image(){
    .width(88).height(175).borderRadius(5)
  }
}

@Extend(Text)
function Selection_rules() {
  .position({ x: '100%', y: '42%' })
  .translate({ x: '-100%' })
  .fontColor('#F6DFC8')
  .fontSize(10)
  .width(54)
  .height(20)
  .backgroundColor('rgba(255, 224, 208, 0.3)')
  .borderRadius({ topLeft: 10, bottomLeft: 10 })
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function Business_ptionsz_menu() {
  .width(78)
  .height(36)
  .backgroundColor('#fff')
  .borderRadius(4)
  .shadow({
    radius: 8,
    color: 'rgba(47, 27, 14, 0.07)',
    offsetX: 1,
    offsetY: 1,
    fill: true
  })
  .textAlign(TextAlign.Center)
  .fontSize(16)
  .fontWeight(400)
}


