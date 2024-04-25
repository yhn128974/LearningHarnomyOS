import curves from '@ohos.curves'

@Entry
@Component
struct image {
  build() {
    Column() {
      Column() {

        Image($r('app.media.cat'))
          .width(200).height(200)
          .aspectRatio(1)// 多态样式
          .stateStyles({
            normal: {
              // 位移右上角定位
              .translate({ x: 0, y: 0, z: 0 })
              // 缩放 比例
              .scale({ x: 1, y: 1 })
              // 旋转
              .rotate({ angle: 0 })
              //
              .show_defail()
            },
            pressed: {
              // .position({ x:'100%'})
              .translate({ x: '100%', y: 100, z: 100 })
              .scale({ x: 0.5, y: 0.5 })
              .rotate({ angle: 180 })
              .show_detail()
            }
          })
          .animation({
            // 动画时长
            duration: 1000,
            // 变化曲线
            curve: curves.springMotion(),
            //延迟
            // delay :1000,
            //播放次数
            iterations: 1
          })
          .aspectRatio(1)


      }
      .border({
        width: 1,
        style: BorderStyle.Solid
      })

      Column() {

      }
      .border({
        width: 1,
        style: BorderStyle.Solid
      })
      .width(100)
      .height(100)
      .position({
        x: '100%',
        y: 100
      })
      .translate({
        x: '-100%',
        y: "50%"
      })
    }

  }

  @Styles
  show_detail(){
    .shadow({
      radius: 10,
      offsetX: 5,
      offsetY: 5,
      color: '#F35417',

    })
  }

  @Styles
  show_defail(){
    .shadow({
      radius: 0,
      offsetX: 0,
      offsetY: 0,
      color: '#fff'

    })
  }
}

