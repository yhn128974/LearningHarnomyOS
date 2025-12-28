import { AlertDialogV2, promptAction } from '@kit.ArkUI';

interface payItem {
  orderName: string;
  orderPrice: number;
  orderDate: Date
}

@Entry
@ComponentV2
struct ForEatchPage {
  @Local list: payItem[] = [
    {
      orderName: 'longyou',
      orderPrice: 1,
      orderDate: new Date('2048/9/7')
    }, {
    orderName: 'ETHAN',
    orderPrice: 2,
    orderDate: new Date('2048/9/7')
  }, {
    orderName: 'YUHAONAN',
    orderPrice: 2,
    orderDate: new Date('2048/9/7')
  }, {
    orderName: 'YUHAONAN',
    orderPrice: 4,
    orderDate: new Date('2048/9/7')
  }, {
    orderName: 'YUHAONAN',
    orderPrice: 5,
    orderDate: new Date('2048/9/7')
  }, {
    orderName: 'YUHAONAN',
    orderPrice: 6,
    orderDate: new Date('2048/9/7')
  }]
  @Local numberList: number[] = Array(20).fill(Date.now())
  @Local refreshing: boolean = false
  @Local ListonReachEnd: boolean = false

  aboutToAppear(): void {
    console.log('page aboutToAppear')
  }

  onPageShow(): void {
    console.log('page show')
  }

  @Builder
  refreshContent() {
    Text('on refreshing...').width('100%').textAlign(TextAlign.Center)
  }

  build() {
    Column() {
      Row() {
        Text('列表布局').fontColor(Color.Blue).fontSize(30)
      }

      //完成下拉刷新
      Refresh({
        refreshing: $$this.refreshing,
        builder: this.refreshContent()
      }) {

        List({
          space: 10
        }) {
          ForEach(
            this.list,
            (item: payItem) => {
            ListItem() {
              GoodsItem({
                currentItem: item
              })
            }

          },
            //重新设置KEY:key（index__+json.stringfy(item)）为新的目标优化性能
            (item: payItem, index) => item.orderPrice.toString())

          ListItem() {
            Text('拼命加载中...').width('100%')
          }
        }
        .height('50%')
        //监听list是否触底
        .onReachEnd(() => {
          if (!this.ListonReachEnd) {

            this.ListonReachEnd = true
            // promptAction.showToast({
            //   message: "onLoading..."
            // })
            setTimeout(() => {
              this.list.splice(this.list.length, 0, {
                orderDate: new Date(),
                orderName: 'zhangfei',
                orderPrice: Math.random()
              })

              this.ListonReachEnd = false
            }, 1000)
          }
        })

      }
      //监听下拉刷新
      .onRefreshing(() => {
        // AlertDialog.show({
        //   message: 'onRefreshing'
        // })

        setTimeout(() => {
          //下拉获取最新数据
          this.list.splice(1, 0, {
            orderDate: new Date(),
            orderName: 'zhangfei',
            orderPrice: Math.random()
          })
          //获取完数据更新下拉状态
          this.refreshing = false
        }, 1000)


      })


      Button('add item').onClick((event: ClickEvent) => {
        this.list.splice(1, 0, {
          orderDate: new Date(),
          orderName: 'zhangfei',
          orderPrice: Math.random()
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct GoodsItem {
  @Param currentItem: payItem = {} as payItem

  build() {
    Column() {
      Text(this.currentItem.orderName).width('100%').border({
        width: {
          bottom: 1
        }
      })
      Image($r('app.media.img')).height(50).width('100%')
      Row() {
        Text(this.currentItem.orderPrice.toString()).fontColor(Color.Red)
        Text(this.currentItem.orderDate.toLocaleDateString())
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)

    }.width('100%').border({
      width: {
        bottom: 1
      }
    })
  }
}