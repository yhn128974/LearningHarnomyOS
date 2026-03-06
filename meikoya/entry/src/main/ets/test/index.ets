import { BreakpointKey, BreakpointSystem, BreakPointType } from '../commons'

@Component
export struct demo5 {
  @StorageProp('currentBreakpoint') curBp: string = 'sm'

  build() {
    Flex({
      justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center
    }) {
      Text(this.curBp).fontSize(50).fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .height('100%')
  }
}


@Component
export struct Demo01 {
  // 绑定的宽度-默认 600
  @State containerWidth: number = 600

  // 底部滑块，可以通过拖拽滑块改变容器尺寸。
  @Builder
  sliderBuilder() {
    Slider({
      value: this.containerWidth, // 绑定的值
      min: 400, // 最小值
      max: 1000, // 最大值
      style: SliderStyle.OutSet // 滑块在滑轨上
    })
      .blockColor(Color.White)
      .width('60%')
      .position({ x: '20%', y: '80%' })
      .onChange((value) => {
        this.containerWidth = value
      })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      // 标记现在的宽度
      Text('宽度:' + this.containerWidth)
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)

      // 核心区域
      Column() {
        Column() {
          Row() {
            // 布局能l力 1：拉伸能力：
            // 容器组件尺寸发生改变时，将变化的部分分配给容器内的【指定区域】
            //

            // 涉及属性：
            // flexShrink:压缩比例，默认值：Column，Row 时（0），Flex 时（1）
            // flexGrow:拉伸比例，默认值 0

            // 需求：
            // 1. 空间不足时：分配给左右，1：1
            // 2. 空间富余时：分配给中间

            // 左
            Row() {
              Text('左')
                .fontSize(20)
                .fontColor(Color.White)
            }
            .justifyContent(FlexAlign.Center)
            .width(150)
            .height(290)
            .backgroundColor('#c2baa6')
            .flexShrink(1)

            // 中
            Row() {
              Text('中')
                .fontSize(30)
                .fontColor(Color.White)
            }
            .width(300)
            .height(290)
            .backgroundColor('#68a67d')
            .justifyContent(FlexAlign.Center)
            .flexGrow(1)

            // 右
            Row() {
              Text('右')
                .fontSize(20)
                .fontColor(Color.White)
            }
            .justifyContent(FlexAlign.Center)
            .width(150)
            .height(290)
            .backgroundColor('#c2baa6')
            .flexShrink(1)

          }
          .width(this.containerWidth)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .border({ width: 2, color: Color.Orange })
          .backgroundColor(Color.Black)
        }

        // 底部滑块
        this.sliderBuilder()
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Pink)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
  }
}


@Component
export struct Demo04 {
  @State sliderWidth: number = 400
  @State sliderHeight: number = 400

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {

    Slider({
      value: this.sliderHeight,
      min: 100,
      max: 400,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .position({ x: '20%', y: '80%' })
      .onChange((value) => {
        this.sliderHeight = value
      })

    Slider({
      value: this.sliderWidth,
      min: 100,
      max: 400,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .position({ x: '20%', y: '87%' })
      .onChange((value) => {
        this.sliderWidth = value
      })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text('宽度:' + this.sliderWidth.toFixed(0) + ' 高度:' + this.sliderHeight.toFixed(0))
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)
      Column() {
        // 动态修改该容器的宽高
        Column() {
          Column() {
            Image($r("app.media.startIcon"))
              .width('100%')
              .height('100%')
          }
          .border({ width: 2, color: Color.Red }) // 边框，仅用于展示效果
          // 布局能力 4：缩放能力
          // 子组件的宽高按照预设的比例，随容器组件发生变化，且变化过程中子组件的【宽高比】不变。

          // 实现方式：
          // 给子组件设置 aspectRatio即可 设置的值是 宽度/高度

        }
        .backgroundColor(Color.Gray)
        .height(this.sliderHeight)
        .width(this.sliderWidth)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        this.slider()
      }
      .width('100%')
      .height('100%')
      .backgroundColor("#F1F3F5")
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }

  }
}


@Component
export struct Demo06 {
  @State rate: number = 48

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {
    Slider({
      value: this.rate,
      min: 0,
      max: 400,
      style: SliderStyle.OutSet
    })
      .blockColor(Color.White)
      .width('60%')
      .height(50)
      .position({ x: '20%', y: '80%' })
      .onChange((value) => {
        this.rate = value
      })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Text('宽度:' + this.rate.toFixed(0))
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)

      Column() {
        // 布局能力 6：隐藏能力
        // 容器组件内的子组件，按照其预设的显示优先级，随容器组件尺寸变化显示或隐藏

        // 实现方式：
        // displayPriority属性：设置布局优先级来控制显隐
        // 当主轴方向剩余尺寸不足以满足全部元素时，按照布局优先级，从[小到大]依次隐藏


        // Row({ space: 10 }) {
        //   Image($r("app.media.ic_public_favor"))
        //     .width(48)
        //     .height(48)
        //
        //
        //   Image($r("app.media.ic_public_play_last"))
        //     .width(48)
        //     .height(48)
        //
        //
        //   Image($r("app.media.ic_public_pause"))
        //     .width(48)
        //     .height(48)
        //
        //
        //   Image($r("app.media.ic_public_play_next"))
        //     .width(48)
        //     .height(48)
        //     .objectFit(ImageFit.Contain)
        //
        //
        //   Image($r("app.media.ic_public_view_list"))
        //     .width(48)
        //     .height(48)
        //     .objectFit(ImageFit.Contain)
        //
        // }
        // .width(this.rate)
        // .height(96)
        // .borderRadius(16)
        // .backgroundColor(Color.Gray)
        // .justifyContent(FlexAlign.Center)
        // .padding(10)

        this.slider()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }

  }
}


interface MovieItem {
  title: string
  img: ResourceStr
}


@Component
export struct Demo09_demo {
  breakpointSystem: BreakpointSystem = new BreakpointSystem()
  @StorageProp(BreakpointKey)
  currentBreakpoint: string = 'sm'

  aboutToAppear(): void {
    this.breakpointSystem.register()
  }

  aboutToDisappear(): void {
    this.breakpointSystem.unregister()
  }

  items: MovieItem[] = [
    { title: '电影标题1', img: $r('app.media.background') },
    { title: '电影标题2', img: $r('app.media.background') },
    { title: '电影标题3', img: $r('app.media.background') },
    { title: '电影标题4', img: $r('app.media.background') },
    { title: '电影标题5', img: $r('app.media.background') },
    { title: '电影标题6', img: $r('app.media.background') },
    { title: '电影标题7', img: $r('app.media.background') },
    { title: '电影标题8', img: $r('app.media.background') },
    { title: '电影标题9', img: $r('app.media.background') },
    { title: '电影标题10', img: $r('app.media.background') },
  ]

  build() {
    Grid() {
      ForEach(this.items, (item: MovieItem) => {
        GridItem() {
          Column({ space: 10 }) {
            Image(item.img)
              .borderRadius(10)
            Text(item.title)
              .width('100%')
              .fontSize(20)
              .fontWeight(600)

          }
        }
      })
    }
    .columnsTemplate(new BreakPointType({
      xs: '1fr',
      sm: '1fr 1fr',
      md: '1fr 1fr 1fr',
      lg: '1fr 1fr 1fr 1fr'
    }).getValue(this.currentBreakpoint))
    .rowsGap(10)
    .columnsGap(10)
    .padding(10)
  }
}


@Component
struct Demo12 {
  @State currentBreakPoint: string = 'sm'

  build() {
    Column() {
      // GridRow 默认支持 4 个断点
      //  xs:(0vp<=width<320vp) 智能穿戴，比如手表
      //  sm:(320vp<=width<600vp) 手机
      //  md:(600vp<=width<840vp) 折叠屏
      //  lg:(840vp<=width) 平板
      GridRow({
        //根据断点值指定一行的列数
        columns: {
          xs: 2,
          sm: 4,
          md: 6,
          lg: 12
        },
        //单位间隔
        gutter: 10
      }) {
        ForEach(Array.from({ length: 12 }), (item: string, index: number) => {
          GridCol({
            //设置一列占的份数
            span: {
              xs: 1,
              sm: 1,
              md: 1,
              lg: 1
            },
            //偏移值
            // offset:1
          }) {

            Text(index.toString())
          }
          .height(100)
          .border({ width: 1, color: Color.Black })
        })
      }
      .width('90%')
      .height('90%')
      .border({ width: 1, color: Color.Orange })
      .onBreakpointChange((breakpoints: string) => {
        //监听当前的断点值
        this.currentBreakPoint = breakpoints
      })

      Text(`断点值: ${this.currentBreakPoint}`)
        .fontSize(30)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#dcdfe8')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}

@Entry
@Component
struct Demo14 {
  build() {
    Stack() {
      // 辅助用的栅格（顶层粉色区域）
      GridRow({ gutter: 10, columns: { sm: 4, md: 8, lg: 12 } }) {
        ForEach(Array.from({ length: 12 }), () => {
          GridCol()
            .width('100%')
            .height('100%')
            .backgroundColor('#baffa2b4')
        })
      }
      .zIndex(2)
      .height('100%')

      //  内容区域
      GridRow({
        // TODO 分别设置不同断点的 列数
        columns: { sm: 4, md: 8, lg: 12 }
      }) {
        // 列
        GridCol({
          // TODO 分别设置不同断点的 所占列数
          span: { sm: 4, md: 6, lg: 8 },
          // TODO 分别设置不同断点的 偏移
          offset: {
            md: 1,
            lg: 2
          }
        }) {
          Column() {
            // logo+文字
            LogoCom()

            // 输入框 + 底部提示文本
            InputCom()

            // 登录+注册账号按钮
            ButtonCom()

          }
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#ebf0f2')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
  }
}

@Component
struct LogoCom {
  build() {
    Column({ space: 5 }) {
      Image($r('app.media.startIcon'))
        .width(80)
      Text('登录界面')
        .fontSize(23)
        .fontWeight(900)
      Text('登录账号以使用更多服务')
        .fontColor(Color.Gray)
    }
    .margin({ top: 100 })
  }
}

@Component
struct InputCom {
  build() {
    Column() {
      Column() {
        TextInput({ placeholder: '账号' })
          .backgroundColor(Color.Transparent)
        Divider()
          .color(Color.Gray)
        TextInput({ placeholder: '密码' })
          .type(InputType.Password)
          .backgroundColor(Color.Transparent)

      }
      .backgroundColor(Color.White)
      .borderRadius(20)
      .padding({ top: 10, bottom: 10 })

      Row() {
        Text('短信验证码登录')
          .fontColor('#006af7')
          .fontSize(14)
        Text('忘记密码')
          .fontColor('#006af7')
          .fontSize(14)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 10 })

    }
    .padding(5)
    .margin({ top: 80 })

  }
}

@Component
struct ButtonCom {
  build() {
    Column({ space: 10 }) {
      Button('登录')
        .width('90%')
      Text('注册账号')
        .fontColor('#006af7')
        .fontSize(16)
    }
    .margin({ top: 60 })
  }
}

export * from './window/mediaCheck'