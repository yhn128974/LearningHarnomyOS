import { GoodItem } from '../day09/moduls';
import { HtmlList } from './components/HtmlList'

@Entry
@Component
struct BuilderParanTranParan {
  @State message: string = 'Hello World';
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

  // 传入子组件的builder体
  @Builder
  setItemListRander(item: GoodItem) {
    Row() {
      Image(item.goods_img).height(150).width(100).borderRadius(10)
      Column() {
        Text(item.goods_name).width('100%')
        Row() {
          Text(item.goods_price.toString()).fontColor(Color.Red)
          Text(`*${item.good_count.toString()}`)
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .layoutWeight(1)
      .padding({
        left: 10,
        right: 10
      })
      .width('100%')
      .height('100%')

    }.height(150)
  }

  build() {
    Row() {
      Column() {
        HtmlList({
          listInfos: this.list,
          listItemParam: (item: object) => {
            this.setItemListRander(item as GoodItem)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }

}