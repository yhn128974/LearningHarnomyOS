interface BannerItem {
  imgUrl: ResourceStr,
  imgTitle: string
}

interface ColumnarItem {
  iconUrl: ResourceStr,
  iconTitle: string
}

interface RecommendItem {
  imgUrl: ResourceStr,
  title: string,
  createTime: string
}

@Entry
@Component
struct Index {
  @State bannerList: BannerItem[] = [
    { imgUrl: $r('app.media.banner_01_1'), imgTitle: '谷歌杀入开源大模型，凭什么问鼎王座？' },
    { imgUrl: $r('app.media.banner_01_3'), imgTitle: '微软牵手OpenAI劲敌！Mistral顶级大模型不再开源' },
    { imgUrl: $r('app.media.banner_01_4'), imgTitle: '生成式AI会扼杀DevSecOps吗' },
    { imgUrl: $r("app.media.banner_01_2"), imgTitle: '微软继续Linux化！sudo原生命令强势登录Windows' },
  ]
  @State columnarList: ColumnarItem[] = [
    { iconUrl: $r('app.media.ic_01_1'), iconTitle: '内容精选' },
    { iconUrl: $r('app.media.ic_01_2'), iconTitle: '学堂' },
    { iconUrl: $r('app.media.ic_01_3'), iconTitle: '鸿蒙开发者社区' },
    { iconUrl: $r('app.media.ic_01_4'), iconTitle: '博客' },
    { iconUrl: $r('app.media.ic_01_5'), iconTitle: '企业培训' },
    { iconUrl: $r('app.media.ic_01_6'), iconTitle: 'Next训练营' },
    { iconUrl: $r('app.media.ic_01_7'), iconTitle: '精培' },
  ]
  @State recommendList: RecommendItem[] = [
    {
      imgUrl: $r('app.media.list_02_1'),
      title: '字节一面：TCP和UDP可以使用同一个端口号吗？',
      createTime: '2024-03-05 10:07:22'
    },
    {
      imgUrl: $r('app.media.list_02_2'),
      title: 'NoSQL：在高并发场景下，数据库和NoSQL如何做到互补？',
      createTime: '2024-03-05 10:03:17'
    },
    {
      imgUrl: $r('app.media.list_02_3'),
      title: '处理大规模并发请求时如何设计和优化Python后端服务的架构和性能',
      createTime: '2024-03-05 10:03:09'
    },
    {
      imgUrl: $r('app.media.list_02_4'),
      title: 'C++右值引用：解锁高效内存管理与性能优化的奥秘',
      createTime: '2024-03-05 09:55:00'
    },
    { imgUrl: $r('app.media.list_02_5'), title: '现代分布式系统架构的权衡分析', createTime: '2024-03-05 09:52:57' },
  ]
  scroller: Scroller = new Scroller()
  @State PageIndex: number = 0;

  build() {
    Column() {
      Row() {
        Image($r('app.media.hot_01'))
          .width(60).onClick(() => {
          this.scroller.scrollEdge(Edge.Top)
        })
        Row() {
          Image($r('app.media.user_01'))
            .width(20)
            .margin({ right: 15 })
          Image($r('app.media.more_01'))
            .width(20)
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height(56)


      Tabs({
        barPosition: BarPosition.End,
      }) {
        TabContent() {
          Scroll(this.scroller) {
            Column() {
              Swiper() {
                ForEach(this.bannerList, (item: BannerItem) => {
                  this.BannerItem(item.imgUrl, item.imgTitle)
                })
              }
              .loop(true)
              .autoPlay(true)
              .interval(3000)
              .indicator(
                Indicator
                  .dot()
                  .left(0)
                  .itemWidth(30)
                  .itemHeight(5)
                  .selectedItemWidth(30)
                  .selectedColor(Color.White)
              )


              Grid() {
                ForEach(this.columnarList, (item: ColumnarItem) => {
                  this.ColumnarItem(item.iconUrl, item.iconTitle)
                })
              }
              .scrollBar(BarState.Off)
              .rowsTemplate('1fr')
              .margin({ top: 10 })
              .width('100%')
              .height(65)


              ColumnSplit()
                .margin({ top: 20, bottom: 20 })
                .width('100%')
                .height(4)
                .backgroundColor('#fbfbfb')

              Text('热门推荐')
                .width('100%')
                .padding({ left: 10 })
                .fontSize(20)
                .fontColor('#303030')
                .fontWeight(700)


              List() {
                ForEach(this.recommendList, (item: RecommendItem) => {
                  this.RecommendItem(item.imgUrl, item.title, item.createTime)
                })
              }
              .padding({ left: 10, right: 10, bottom: 20 })
            }

          }
        }
        .tabBar(this.MessageInfoStyle(0, '首页'))

        TabContent() {
          Image($r('app.media.banner_01_4')).width('100%').height('100%')
        }.tabBar(this.MessageInfoStyle(1, '视频'))

        TabContent() {
          Text('等待消息完成')
        }.tabBar(this.MessageInfoStyle(2, '消息'))

        TabContent() {
          Text('我的信息')
        }.tabBar(this.MessageInfoStyle(3, '我的'))
      }
      .barMode(BarMode.Fixed)
      .layoutWeight(1)
      .onTabBarClick((index: number) => {
        // 获取索引 并赋值
        this.PageIndex = index
      })
      .onChange((index: number) => {
        // 获取索引 并赋值
        this.PageIndex = index
      })
      .backgroundImage(this.PageIndex == 1 ? $r('app.media.bg_02_2') : $r('app.media.bg_02_1'))
      .backgroundImagePosition(Alignment.BottomEnd)
      .backgroundImageSize({
        height: 55,
        width: '100%'
      })
    }
  }

  @Builder
  MessageInfoStyle(contentIndex: number, tabTitle: string) {

    if (contentIndex == 2) {
      Badge({
        count: 9,
        position: {
          x: 25,
          y: -5
        }, style: {}
      }) {
        Text(tabTitle).fontColor(contentIndex == this.PageIndex ? "#000" : "#999").fontWeight(600)
      }
    } else if (contentIndex == 1) {
      Text(tabTitle).fontColor(contentIndex == this.PageIndex ? '#fff' : '#999').fontWeight(600)
    } else {
      Text(tabTitle).fontColor(contentIndex == this.PageIndex ? "#000" : "#999").fontWeight(600)
    }


  }

  @Builder
  RecommendItem(img: ResourceStr, title: string, createTime: string) {
    ListItem() {
      Row() {
        Image(img)
          .width(142)
          .borderRadius(8)
        Column() {
          Text(title)
            .fontSize(15)
            .fontColor('#303030')
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(createTime)
            .fontSize(12)
            .fontColor('#c0c0c0')
        }
        .margin({ left: 10 })
        .layoutWeight(1)
        .height('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Start)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(110)
      .padding({ top: 15, bottom: 15 })
      .border({ width: { bottom: 2 }, color: '#f4f4f4' })
    }
  }

  @Builder
  ColumnarItem(icon: ResourceStr, title: string) {
    GridItem() {
      Column() {
        Image(icon)
          .width(40)
        Text(title)
          .fontSize(14)
          .fontColor('#666')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 12, right: 12 })
      .height('100%')
    }
  }

  @Builder
  BannerItem(img: ResourceStr, title: string) {
    Stack() {
      Image(img)
        .width('100%')
      Text(title)
        .fontColor(Color.White)
        .fontWeight(700)
        .margin({ left: 10, bottom: 30, right: 10 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .alignContent(Alignment.BottomStart)
  }
}