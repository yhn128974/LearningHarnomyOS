@Entry
@Component
struct NavigationCase {
  @State message: string = 'Hello World';
  // api9 Navigation 方法
  build() {
    Navigation() {
      // NavRouter必须放两个页面最后一个必须是NavDestination
      NavRouter() {
        //跳转链接
        Text('PAGE A')

        // 跳转内容
        NavDestination() {
          PageA()
        }.title('Atitle')
      }

      NavRouter() {
        Button('PAGE B')

        NavDestination() {
          Text('PAGE B text')
        }.title('Btitle')
      }
    }
  }
}

@Component
struct PageA {
  @State message: string = 'Wecome! page A';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

