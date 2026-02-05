import { AppUser, UserModel } from "../../models"
import { PersistenceV2 } from "@kit.ArkUI"
import { navPathStack } from "./navPathStack"

export class Auth {
  setUserInfo(user: UserModel) {
    //存储token到本地
    const appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    //重新赋值而不是更换地址，保证响应式更新
    appUser.user.id = user.id
    appUser.user.username = user.username
    appUser.user.avatar = user.avatar
    appUser.user.token = user.token
    appUser.user.nickName = user.nickName
    appUser.user.totalTime = user.totalTime
    appUser.user.clockinNumbers = user.clockinNumbers

  }

  getUserInfo() {
    //存储token到本地
    const appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    return appUser.user
  }

  //访问控制
  //1.对页面跳转进行拦截
  //2.对方法调用进行拦截
  checkAuth(options: Function | NavPathInfo) {
    const user = this.getUserInfo()
    if (typeof options == 'function') {
      if (user.token) {
        options()
      } else {
        navPathStack.pushPath({
          name: "LoginPage"
        }, {
          launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON
        })

      }
    } else {
      //
      if (user.token) {
        navPathStack.pushPath(options)
      } else {
        //记录当前跳转的NAME,便于回调
        const param = options.param as Record<string, string> || {}
        //
        param.return_name = options.name
        navPathStack.pushPath({
          name: "LoginPage",
          param
        }, {
          launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON
        })
      }
    }

  }
}

export const author = new Auth()