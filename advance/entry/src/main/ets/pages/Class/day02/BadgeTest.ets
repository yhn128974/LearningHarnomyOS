@Entry
@Component
struct BadgeDemo {
  build() {
    Column() {
      // 1. 基本使用 必须要传入style？
      Badge({ count: 5, style: {} }) {
        Text('信息')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }

      // 2. 调整位置
      Badge({ count: 10, position: BadgePosition.Left, style: {} }) {
        Text('感觉自己萌萌哒')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }

      Badge({ count: 10, position: BadgePosition.Right, style: {} }) {
        Text('感觉自己萌萌哒')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }


      // 3. 最大个数
      Badge({ count: 12, maxCount: 10, position: BadgePosition.Right, style: {} }) {
        Text('感觉自己萌萌哒')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }


      // 4. 调整样式
      Badge({
        count: 12,
        style: {
          fontSize: 20,
          color: Color.Orange,
          badgeColor: Color.Black,
          borderColor: Color.Black,
          badgeSize: 30
        }
      }) {
        Text('感觉自己萌萌哒')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }

      Badge({count:10,style: {}}) {
        Text('感觉自己萌萌哒')
          .border({ width: .5, })
          .borderRadius(10)
          .padding(10)
      }

    }
    .padding(10)
  }
}