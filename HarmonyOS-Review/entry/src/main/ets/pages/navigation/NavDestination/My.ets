import { promptAction } from "@kit.ArkUI"
import { User } from "../model"
import { JSON } from "@kit.ArkTS"

@ComponentV2
export struct My {
  //共享路由栈
  // @Consumer() navPathStack: NavPathStack = new NavPathStack()

  navPathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        Text('我是个人中心页面')
        Button('go to list').onClick(() => {
          this.navPathStack.pushPath({
            name: "list"
          })
        })

        Button('go to back').onClick(() => {
          //返回上一页得到的数据
          this.navPathStack.pop(123456)
        })

      }
    }
    .title('个人中心')
    .onReady((context: NavDestinationContext) => {
      //获得navPathStack
      this.navPathStack = context.pathStack
    })
    .onAppear(() => {
      //获得主页转递的值
      let Alice: User = this.navPathStack.getParamByName('my')[0] as User
      console.log(Alice.name)
    })

  }
}

@Builder
export function myBuilder() {
  My()
}