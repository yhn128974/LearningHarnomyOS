import { GoodItemModel } from './moduls'
import { SegmentButton, SegmentButtonOptions } from '@kit.ArkUI';
import { ItemRestriction, SegmentButtonTextItem } from '@ohos.arkui.advanced.SegmentButton';

@Entry
@Component
struct ForEachGoodCase {
  @State message: string = 'Hello World';
  @State GoodItemModelInformation: GoodItemModel[] = [
    new GoodItemModel(
      {
        id: 1,
        goods_name: "班俏BANQIAO超火ins潮卫衣女士2020秋季新款韩版宽松慵懒风薄款外套带帽上衣",
        goods_img: 'app.media.1',
        goods_price: 108,
        goods_count: 1,
      }
    ),
    new GoodItemModel(
      {
        id: 2,
        goods_name: "嘉叶希连帽卫衣女春秋薄款2020新款宽松bf韩版字母印花中长款外套ins潮",
        goods_img: "app.media.2",
        goods_price: 129,
        goods_count: 1,
      },
    ),
    new GoodItemModel(
      {
        id: 3,
        goods_name: "思蜜怡2020休闲运动套装女春秋季新款时尚大码宽松长袖卫衣两件套",
        goods_img: "app.media.3",
        goods_price: 198,
        goods_count: 1,
      },
    ),

    new GoodItemModel(
      {
        id: 4,
        goods_name: "思蜜怡卫衣女加绒加厚2020秋冬装新款韩版宽松上衣连帽中长款外套",
        goods_img: "app.media.4",
        goods_price: 99,
        goods_count: 1,
      },
    ),
    new GoodItemModel(
      {
        id: 5,
        goods_name: "幂凝早秋季卫衣女春秋装韩版宽松中长款假两件上衣薄款ins盐系外套潮",
        goods_img: "app.media.5",
        goods_price: 156,
        goods_count: 1,
      },
    )
  ]
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '单列' }, { text: '双列' }],
  })
  @State tabSelectedIndexes: number[] = [0]

  build() {
    Row() {
      Column() {
        SegmentButton({ options: this.tabOptions, selectedIndexes: $tabSelectedIndexes })
        if (this.tabSelectedIndexes.includes(0)) {
          List({
            space: 10
          }) {
            ForEach(this.GoodItemModelInformation, (item: GoodItemModel, index: number) => {
              ListItem() {
                Row() {
                  Image($r(item.goods_img.toString())).height(150).width(100).borderRadius(10)
                  Column() {
                    Text(item.goods_name).width('100%')
                    Row() {
                      Text(item.goods_price.toString()).fontColor(Color.Red)
                      Text(`*${item.goods_count.toString()}`)
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
            })
          }.padding(10)
        } else if (this.tabSelectedIndexes.includes(1)) {
          Grid() {
            ForEach(this.GoodItemModelInformation, (item: GoodItemModel, index: number) => {
              GridItem() {
                Column() {
                  Image($r(item.goods_img.toString())).borderRadius(10).height(200)
                  Column() {
                    Text(item.goods_name).width('100%').maxLines(1).textOverflow({
                      overflow: TextOverflow.Ellipsis
                    }).fontWeight(FontWeight.Bold)
                    Row() {
                      Text(`￥${item.goods_price.toString()}`).fontColor(Color.Red)
                      Text(`*${item.goods_count.toString()}`)
                    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
                  }
                  .justifyContent(FlexAlign.SpaceBetween)
                  .padding({
                    left: 10,
                    right: 10
                  })
                }
              }
            })

          }.padding(10).columnsTemplate('1fr 1fr').columnsGap(10).rowsGap(10)
        }


      }
      .width('100%')
    }
    .height('100%')
  }
}