interface img_url_interface {
  url: string,
  text: string,

}


let img_url: img_url_interface[] = [
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },
  {
    url: 'app.media.img02',
    text: "京东超市"
  },

  {
    url: 'app.media.img02',
    text: "京东超市"
  },

  {
    url: 'app.media.img02',
    text: "京东超市"
  },

]

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        List({ space: 10 }) {
          ForEach(img_url, (item: img_url_interface, index) => {
            ListItem() {
              Column() {
                Row() {
                  Image($r(item.url))
                }.width('100%').margin({
                  bottom: 10
                })
                Text(item.text).linearGradient_defual()
              }
            }.border({
              width: 1,
              style: BorderStyle.Solid
            }).my_show()
          })
        }.width('100%').lanes(5, 10).padding(10)

      }
      .width('100%')

      Text()
        .layoutWeight(1)
        .border({
          width: 1,
          style: BorderStyle.Solid
        })
        .width('100%')
        .margin(10)
        .backgroundColor(Color.Black)

        .stateStyles({


          normal: {

          },
          // 按下时
          pressed: {
            .radialGradient_defual()

          },

          //组件获焦状态的样式
          // focused:{
          //   .radialGradient_defual()
          // },

          // 组件点击状态的样式
          // clicked:{
          //   .radialGradient_defual()
          //   .my_animation()
          // },

          //组件禁用状态的样式
          // disabled:{
          //
          // }
        })
        .my_animation()

    }

  }

  @Styles
  my_show(){
    .shadow({
      // 模糊半径
      radius: 10,
      // 阴影类型
      type: ShadowType.COLOR,
      // 阴影颜色
      color: 'rgba(0,0,0,0.5)',
      // X 轴偏移
      offsetX: 5,
      // Y 轴偏移
      offsetY: 5,
      // 是否内部填充，值为布尔型，默认为flase
      fill: false
    })
  }

  @Styles
  my_animation() {

    .animation({
      duration: 1000,
      // 速度曲线
      curve: Curve.EaseInOut,
      delay: 0,
      iterations: 1
    })

  }
}

@Extend(Text)
function linearGradient_defual() {
  .linearGradient({
    angle: 90,
    direction: GradientDirection.Right,
    // [[颜色1, 颜色1渐变开始的位置], [颜色2, 颜色2渐变结束的位置]
    colors: [['red', 0], [Color.Pink, 1]],
    repeating: false
  })
}

@Extend(Text)
function radialGradient_defual() {
  .radialGradient({
    //镜像渐变
    center: ['50%', '50%'],
    // 渐变半径
    radius: '50%',
    // rgba(255,255,255,1:透明度(0~1) 1;完全不透明 0：完全透明)
    colors: [['rgba(255,255,255,1)', 0], ['rgba(255,255,255,0)', 1]],
    // repeating:true
  })
}






