import { JSON } from "@kit.ArkTS"
import { author } from "."
import { promptAction } from "@kit.ArkUI"

export const navPathStack: NavPathStack = new NavPathStack()

//声明一个数组，存储需要授权的页面路径
let AuthNames: string[] = ['QuestionPage']

//navagation 路由拦截器
navPathStack.setInterception({
  // 页面跳转前拦截，允许操作栈，在当前跳转中生效。
  willShow(from, to: NavBar | NavDestinationContext) {
    // 要去的是navigation首页 navBar, 无需处理
    if (typeof to === 'string') {
      return
    }
    // 要去的是需要授权的页面, 如果未登陆, 需要做拦截, 已登录, 不用处理
    if (AuthNames.includes(to.pathInfo.name)) {
      let user = author.getUserInfo()
      if (!user.token) {
        promptAction.showToast({
          message: '当前用户未登录, 请登录'
        })
        to.pathStack.pop()
        to.pathStack.pushPath({
          name: 'LoginPage'
        })
      }
    }
  }
})