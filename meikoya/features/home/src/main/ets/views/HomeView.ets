import {
  AppBreakPoint,
  AppCategory,
  AppSafeArea,
  BreakPointEnum,
  BreakPointType,
  CategoryItem,
  HDMGoodsItem,
  HDMLoading,
  ListDataSource,
  PAGE_PATH
} from 'basic'
import { HDMDiscountGoods, HDMGoods } from '../components'
import { Banner, Params, DiscountType } from '../viewmodels'
import { AppStorageV2, promptAction } from '@kit.ArkUI'
import {
  getBannerAPI,
  getCategoryAPI,
  getHomeNewAPI,
  getHotResultAPI,
  getInVogueAPI,
  getOneStopAPI,
  getRecommendAPI
} from '../api/home'
import { HMRouterMgr } from '@hadss/hmrouter'


@ComponentV2
export struct HomeView {
  //刷新
  @Local refresh: boolean = false
  //加载
  @Local
  loading: boolean = false
  //获取安全区域的原高度
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  //获取断点值
  breakObj: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  // 轮播图
  // 轮播图
  @Local
  banners: Banner[] = []
  // 分类
  @Local
  categories: CategoryItem[] = []
  // 特惠推荐
  @Local
  saleGoods: HDMGoodsItem[] = []
  // 爆款推荐
  @Local
  hotGoods: HDMGoodsItem[] = []
  // 一站买全
  @Local
  oneGoods: HDMGoodsItem[] = []
  // 新鲜好物
  @Local
  newGoods: HDMGoodsItem[] = []
  //记录y轴的漂移量
  @Local
  yOffset: number = 0
  //记录搜索框的透明度
  @Local
  searchOpacity: number = 1
  //加载更多状态
  @Local
  page: number = 1 // 请求的页码
  @Local
  isReachLoad: boolean = false // 是否已经请求完成
  @Local
  isFinished: boolean = false // 是否已经没有数据了
  @Local
  recommendGoods: HDMGoodsItem[] = []
  //创建一个lazyforeach数据源对象
  dataSource: ListDataSource<HDMGoodsItem> = new ListDataSource()

  // 生成模拟数据
  mockData() {
    this.banners = new Array(6).fill({
      id: "42",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png",
      hrefUrl: "/category/1181622006",
      type: "1"
    })

    this.categories = new Array(10).fill({
      id: "1181622001",
      name: "气质女装",
      picture: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png"
    })

    this.saleGoods = new Array(6).fill({
      "id": "1111002",
      "name": "剪出精致感，金致圆柄复古剪刀",
      "desc": "轻薄设计，简约大方",
      "price": "9.90",
      "picture": "https://yanxuan-item.nosdn.127.net/4c6a9c8a579b00e5e9c7b002d15a33a2.jpg",
      "orderNum": 172
    },)

    this.hotGoods = new Array(8).fill({
      "id": "1135059",
      "name": "手工八年老陈醋500毫升",
      "desc": "地道醇香，醋酸浓郁",
      "price": "30.00",
      "picture": "https://yanxuan-item.nosdn.127.net/77da20e77b02830a26f931901ac1a9e0.png",
      "orderNum": 147
    },)
    this.oneGoods = new Array(8).fill({
      "id": "1135079",
      "name": "免浸泡，12种谷物一次同享，五谷米400克",
      "desc": "无需浸泡，同煮同熟",
      "price": "9.90",
      "picture": "https://yanxuan-item.nosdn.127.net/bfe70bd66efe94f2f18061c707d2a097.png",
      "orderNum": 144
    })
    this.newGoods = new Array(8).fill({
      "id": "4027998",
      "name": "亮碟多效合一洗涤块495g",
      "desc": "洗碗机专用，强力去污",
      "price": "69.90",
      "picture": "https://yanxuan-item.nosdn.127.net/e07c2b63765cf9f4a46d489c6e09c1c1.jpg",
      "orderNum": 643
    })

    this.recommendGoods = new Array(8).fill({
      "id": "4033959",
      "name": "3秒快速拆琴轻松保养odin奥丁12半音阶口琴",
      "price": 329,
      "picture": "https://yanxuan-item.nosdn.127.net/937a8e46a9284e8f7e00e13911ecfbe7.png",
      "payCount": 0
    })
  }

  //
  async getHomeDate(first?: boolean) {
    this.loading = !!first
    //任务池机制多线程发送请求
    // Promise.all([])//全部请求收到结果（成功）完毕之后在执行下一部如果有失败则得到第一个失败的对象，
    // Promise.allSettled() //全部请求发送完毕之后再执行（不一定所有都成功），得到所有可能的结果，

    this.banners = await getBannerAPI()
    this.categories = await getCategoryAPI()

    //将值保存到内存中给全局调用
    const app = AppStorageV2.connect(AppCategory, () => new AppCategory())!
    app.category = this.categories
    //
    const result = await getHotResultAPI()
    this.saleGoods = result.subTypes?.[0]?.goodsItems?.items || []

    this.hotGoods = (await getInVogueAPI()).subTypes?.[0]?.goodsItems?.items || []
    this.oneGoods = (await getOneStopAPI()).subTypes?.[0]?.goodsItems?.items || []
    this.newGoods = await getHomeNewAPI()
    //
    await this.getRecommend()

    this.loading = false


    // this.dataSource.loadData(await getRecommendAPI({ limit: 8 * this.page }))

    // const result =
    //   await Promise.allSettled([getBannerAPI(), getCategoryAPI(), getHotResultAPI(), getInVogueAPI(),
    //     getOneStopAPI(),
    //     getHomeNewAPI()])
    //
    // if (result[0].status === "fulfilled") {
    //   //如果状态是成功则进行赋值
    //   this.banners = result[0].value
    // }
    // if (result[1].status === "fulfilled") {
    //   this.categories = result[1].value
    // }
    // if (result[2].status === "fulfilled") {
    //   this.saleGoods = result[2].value?.subTypes?.[0]?.goodsItems?.items || []
    //   //this.saleGoods = result[2].value
    // }
    // if (result[3].status === "fulfilled") {
    //   this.hotGoods = result[3].value?.subTypes?.[0]?.goodsItems?.items || []
    // }
    // if (result[4].status === "fulfilled") {
    //   this.oneGoods = result[4].value?.subTypes?.[0]?.goodsItems?.items || []
    // }
    // if (result[5].status === "fulfilled") {
    //   this.newGoods = result[5].value
    // }
  }

  async getRecommend() {
    const list = await getRecommendAPI({ limit: 8 * this.page })
    if (list.length === this.page * 8) {
      this.page++
    } else {
      this.isFinished = true
      promptAction.showToast({ message: '没有下一页了' })
    }
    // 我要50条数据 你给50条 认为你还有  我要50条 你给49条，我认为你没了
    // this.dataSource.loadData(list)
    this.recommendGoods = list

  }

  aboutToAppear(): void {
    // mock数据
    // this.mockData()

    this.getHomeDate(true)
  }

  @Builder
  DiscountBuilder(params: Params) {

    Column() {
      Row({ space: 10 }) {
        Text(params.title)
          .fontColor($r('[basic].color.black'))
          .fontSize(14)
        Text(params.subTitle)
          .fontColor($r('[basic].color.text'))
          .fontSize(11)
      }
      .width('100%')
      .margin({ bottom: 10 })

      List({ space: 10 }) {
        ForEach(params.list, (item: HDMGoodsItem) => {
          ListItem() {
            HDMDiscountGoods({ type: DiscountType.DISCOUNT, goods: item })
          }
        })
      }
      .width('100%')
      .height(116)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .height(160)
    .layoutWeight(1)
    .padding(10)
    .backgroundColor(params.bg)
    .borderRadius(8)
  }

  @Builder
  RefreshBuilder() {
    HDMLoading({
      imageWith: 100
    })
  }

  build() {

    RelativeContainer() {
      if (this.loading) {
        HDMLoading({
          imageWith: 100
        })
      } else {
        Refresh({
          refreshing: this.refresh!!,
          builder: this.RefreshBuilder()
        }) {
          Scroll() {
            Column() {
              // 轮播图 + 搜索
              Stack({ alignContent: Alignment.Top }) {
                Swiper() {
                  ForEach(this.banners, (item: Banner) => {
                    Image(item.imgUrl)
                  })
                }
                .displayCount(
                  new BreakPointType({
                    xs: 1,
                    md: 2,
                    lg: 3
                  }).getValue(this.breakObj.breakPoint)
                )
                .indicator(
                  this.breakObj.breakPoint == BreakPointEnum.SM ?
                    DotIndicator.dot()
                      .itemWidth(8)
                      .itemHeight(4)
                      .color('#33191919')
                      .selectedItemWidth(24)
                      .selectedItemHeight(4)
                      .selectedColor('#191919') :
                    false
                )
                .itemSpace(new BreakPointType({
                  xs: 0,
                  md: 10,
                  lg: 20
                }).getValue(this.breakObj.breakPoint))

              }
              .width('100%')


              // 分类
              Column({ space: 10 }) {

                // 分类
                List({
                  space: new BreakPointType({
                    xs: 14,
                    md: 36,
                    lg: 72
                  }).getValue(this.breakObj.breakPoint)
                }) {
                  ForEach(this.categories, (item: CategoryItem) => {
                    ListItem() {
                      Column() {
                        Image(item.picture)
                          .width(56)
                          .aspectRatio(1)
                        Text(item.name)
                          .fontSize(10)
                          .fontColor('#CC191919')
                      }
                      .width(60)
                      .height(80)
                      .borderRadius(30)
                      .clip(true)
                      .backgroundImage(item.picture)
                      .backgroundImageSize(ImageSize.Contain)
                      .backgroundImagePosition(Alignment.Center)
                      .backgroundBlurStyle(
                        BlurStyle.BACKGROUND_ULTRA_THICK,
                        { scale: 0.25 }
                      )
                    }
                  })
                }
                .width('100%')
                .height(92)
                .scrollBar(BarState.Off)
                .listDirection(Axis.Horizontal)
                .alignListItem(ListItemAlign.Center)

                // 特惠推荐
                Column({ space: 10 }) {
                  Image($r('app.media.home_cmd_title'))
                    .width(150)
                    .height(20)
                  Row() {
                    Image($r('app.media.home_cmd_inner'))
                      .width(86)
                      .height(116)
                    List({
                      space: new BreakPointType({
                        xs: 14,
                        md: 36,
                        lg: 72
                      }).getValue(this.breakObj.breakPoint)
                    }) {
                      ForEach(this.saleGoods, (item: HDMGoodsItem) => {
                        ListItem() {
                          HDMDiscountGoods({ goods: item })
                        }
                      })
                    }
                    .layoutWeight(1)
                    .width('100%')
                    .height(116)
                    .backgroundColor($r('[basic].color.white'))
                    .borderRadius({
                      topRight: 8,
                      bottomRight: 8
                    })
                    .padding({ right: 10, left: 10 })
                    .scrollBar(BarState.Off)
                    .listDirection(Axis.Horizontal)
                  }
                }
                .width('100%')
                .height(166)
                .backgroundImage($r('app.media.home_cmd_sm'))
                .backgroundImageSize(ImageSize.Cover)
                .borderRadius(8)
                .padding(10)
                .alignItems(HorizontalAlign.Start)

                // 爆款推荐+一站买全
                Row({ space: 10 }) {
                  this.DiscountBuilder({
                    title: '爆款推荐',
                    subTitle: '最受欢迎',
                    bg: '#EDF1FB',
                    list: this.hotGoods
                  })
                  this.DiscountBuilder({
                    title: '一站买全',
                    subTitle: '精心优选',
                    bg: '#FCF6EA',
                    list: this.oneGoods
                  })
                }

                // 新鲜好物
                Column({ space: 10 }) {
                  Image($r('app.media.home_new'))
                    .width(146)
                    .height(19)
                  List({
                    space: new BreakPointType({
                      xs: 14,
                      md: 36,
                      lg: 72
                    }).getValue(this.breakObj.breakPoint)
                  }) {
                    ForEach(this.newGoods, (item: HDMGoodsItem) => {
                      ListItem() {
                        HDMDiscountGoods({ type: DiscountType.NEW, goods: item })
                      }
                    })
                  }
                  .width('100%')
                  .height(116)
                  .scrollBar(BarState.Off)
                  .listDirection(Axis.Horizontal)
                }
                .width('100%')
                .height(156)
                .padding(10)
                .backgroundColor('#F7EFF5')
                .borderRadius(8)
                .alignItems(HorizontalAlign.Start)

                // 推荐商品
                WaterFlow() {

                  // LazyForEach(this.dataSource, (item: HDMGoodsItem) => {
                  //   FlowItem() {
                  //     HDMGoods({ goods: item })
                  //   }
                  // })

                  //Repeat渲染,each循环的是一个包含item和index的对象
                  Repeat<HDMGoodsItem>(this.recommendGoods).each((obj) => {
                    FlowItem() {
                      HDMGoods({ goods: obj.item })
                    }
                  }).virtualScroll()
                    .key((item, index) => {
                      return `${index}_${JSON.stringify(item)}`
                    })

                }
                .nestedScroll({
                  //设置WaterFlow在嵌套滚动时的优先级
                  scrollForward: NestedScrollMode.PARENT_FIRST,
                  scrollBackward: NestedScrollMode.SELF_FIRST
                })
                .columnsTemplate(new BreakPointType({
                  sm: '1fr 1fr',
                  md: '1fr 1fr 1fr',
                  lg: '1fr 1fr 1fr 1fr'
                })
                  .getValue(this.breakObj.breakPoint))
                .columnsGap(8)
                .rowsGap(10)
                .height('100%')
                .onReachEnd(async () => {
                  if (!this.isReachLoad && !this.isFinished) {
                    this.isReachLoad = true
                    await this.getRecommend()
                    this.isReachLoad = false
                  }
                })
              }
              .padding({
                left: 8,
                right: 8,
                bottom: 10,
                top: 10
              })
            }
          }
          .scrollBar(BarState.Off)
          .onDidScroll((xOffset, yOffset) => {
            // promptAction.openToast({
            //   message: yOffset.toString()
            // })
            this.yOffset += yOffset
            if (this.yOffset < this.safeArea.topHeight) {
              this.searchOpacity = 0
            } else if (this.yOffset > this.safeArea.topHeight && this.yOffset < this.safeArea.topHeight + 40) {
              this.searchOpacity = (this.yOffset - this.safeArea.topHeight) / 40
            } else {
              this.searchOpacity = 1
            }
          })
        }
        .onRefreshing(async () => {

          this.page = 1
          await this.getHomeDate()

          this.refresh = false
        })

        //search
        Row() {
          Row({ space: 4 }) {
            Image($r('[basic].media.ic_public_search'))
              .width(16)
              .height(16)
              .fillColor($r('[basic].color.white'))
            Text('搜索...')
              .fontSize(14)
              .fontColor($r('[basic].color.white'))
          }
          .backgroundColor('#33191919')
          .width('100%')
          .height(40)
          .borderRadius(20)
          .padding({ left: 12 })
        }
        .opacity(this.searchOpacity)
        .linearGradient({
          direction: GradientDirection.Bottom,
          colors: [["#ff949dec", 0], ["#fff", 1]]
        })
        .padding({
          left: 16,
          right: 16,
          top: this.safeArea.topHeight,
          bottom: this.safeArea.topHeight,
        })
        .onClick(() => {
          HMRouterMgr.push({
            pageUrl: PAGE_PATH.SEARCH_PAGE
          })
        })
      }
    }

  }
}