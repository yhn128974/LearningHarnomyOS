import { GoodItem, WorkRecord } from './moduls'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WaterFlowCase {
  @State list: GoodItem[] = [
    {
      id: 1,
      goods_name: "班俏BANQIAO超火ins潮卫衣女士2020秋季新款韩版宽松慵懒风薄款外套带帽上衣",
      goods_img: $r('app.media.1'),
      goods_price: 108,
      good_count: 1,
    }, {
    id: 2,
    goods_name: "嘉叶希连帽卫衣女春秋薄款2020新款宽松bf韩版字母印花中长款外套ins潮",
    goods_img: $r('app.media.2'),
    goods_price: 129,
    good_count: 1,
  },
    {
      id: 3,
      goods_name: "思蜜怡2020休闲运动套装女春秋季新款时尚大码宽松长袖卫衣两件套",
      goods_img: $r('app.media.3'),
      goods_price: 198,
      good_count: 1,
    },
    {
      id: 4,
      goods_name: "思蜜怡卫衣女加绒加厚2020秋冬装新款韩版宽松上衣连帽中长款外套",
      goods_img: $r('app.media.4'),
      goods_price: 99,
      good_count: 1,
    },
    {
      id: 5,
      goods_name: "幂凝早秋季卫衣女春秋装韩版宽松中长款假两件上衣薄款ins盐系外套潮",
      goods_img: $r('app.media.5'),
      goods_price: 156,
      good_count: 1,
    },
    {
      id: 6,
      goods_name: "ME&CITY女装冬季新款针织抽绳休闲连帽卫衣女",
      goods_img: $r('app.media.6'),
      goods_price: 142.8,
      good_count: 1,
    }

  ]
  scroller = new Scroller()
  @State loading: boolean = false

  // 加载更多数据
  async loadMore() {
    this.loading = true
    //设置同步等待

    return await new Promise<boolean>((resolve, reject,) => {
      setTimeout(() => {
        // 拿到数据追加
        this.list.push(...this.list.slice(0, 5))
      }, 1000)
      // await等待后面的promise执行resolve
      resolve(true)
    })

  }

  @Builder
  FlowerItemBulder(item: GoodItem, index: number) {
    Column({
      space: 10
    }) {
      // 隐式转换
      Image(item.goods_img).borderRadius(10)
        .height(index % 2 ? 180 : 220)
      Text(item.goods_name)
    }
  }

  @Builder
  WaterFlowerFooter() {
    Row({
      space: 4
    }) {
      Text('数据加载中')
      LoadingProgress().width(24).height(24)
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      WaterFlow({
        scroller: this.scroller,
        footer: this.WaterFlowerFooter()
      }) {
        ForEach(this.list, (item: GoodItem, index: number) => {
          FlowItem() {
            this.FlowerItemBulder(item, index)
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .padding(20)
      .rowsGap(20)
      .columnsGap(20)
      .onReachEnd(() => {

        promptAction.showToast({
          message: '滚动到底部'

        })
        //   对于频繁请求要做阀门控制
        if (!this.loading) {
          try {
            this.loadMore().then((res) => {
              promptAction.showToast({ message: `执行完毕${res}` })
              this.loading = false
            })
          } catch (err) {
            console.log(err)
          }


        }
      })
    }

  }
}

