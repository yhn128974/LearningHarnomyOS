import { curves } from '@kit.ArkUI'
interface information {
  imagurl: string,
  text: string
}

@Entry
@Component
struct Index {
  @State titleInformations: information[] = [
    {
      imagurl: 'app.media.prd5_01',
      text: '2023亚马逊云科技re:Invent 中国行'
    }, {
    imagurl: 'app.media.prd5_02',
    text: '数据、AI和人类共进共生，重塑生成式AI时代的数据战略'
  },
    {
      imagurl: 'app.media.prd5_03',
      text: '亚马逊再次重构云计算 开创企业级生成式 AI 时代'
    },


  ]


  build() {
    Column({space: 10}) {
      // 顶部
      Text('预约观看直播')
        .width('100%')
        .height(60)
        .backgroundColor(Color.Orange)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .fontWeight(700)
        .fontColor('#333')
        .margin({top: 10})


      // 直播内容
      List() {

        ForEach(this.titleInformations,(item:information,index)=> {
          ListItem() {
            Column({ space: 10 }) {
              // 图片
              Image($r(item.imagurl))
                .borderRadius(10)
              // 标题文字
              Text(item.text)
                .width('100%')
                .fontWeight(700)
                .lineHeight(22)
              // 简介及预约

              Row(){
                Text('大V在现场')
                  .fontSize(14)
                  .fontColor('#999')

                Button('立即预约')
                  .width(95)
                  .height(34)
                  .fontSize(14)


                  .stateStyles({
                    normal: {
                      .linearGradient_defual()

                    },
                    clicked: {
                      .linearGradient_pressed()
                    }
                  })
                  .animation({
                    // 动画时长
                    duration: 100,
                    // 变化曲线
                    curve: curves.springMotion(),
                    //延迟
                    // delay :1000,
                    //播放次数
                    iterations: 1
                  })
              }.justifyContent(FlexAlign.SpaceBetween).width('100%')
            }
          }
          .width('100%')
          .backgroundColor('#fff')
          .borderRadius(20)
          .padding(10)
          .shadow({
            radius:5,
            type: ShadowType.COLOR,
            color: 'rgba(0,0,0,0.5)',
          })

        })
      }
      .layoutWeight(1)
      .divider({strokeWidth: 10, color: 'transparent'})
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .backgroundColor('#f0f0f0')
    .padding({left: 10, right: 10})
  }

  @Styles linearGradient_defual() {
  .linearGradient({
    angle:135,
    // direction: GradientDirection.Right,
    // [[颜色1, 颜色1渐变开始的位置], [颜色2, 颜色2渐变结束的位置]
    colors: [['#fb4414', 0], ['#fa080', 1]],
    repeating: false
  })
}
  @Styles linearGradient_pressed() {
    .linearGradient({
      angle:135,
      // direction: GradientDirection.Right,
      // [[颜色1, 颜色1渐变开始的位置], [颜色2, 颜色2渐变结束的位置]
      colors: [['#1E90FF', 0], ['#00008', 1]],
      repeating: false
    })
  }

}