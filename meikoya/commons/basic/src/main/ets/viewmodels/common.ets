import { BreakPointEnum } from "./break_point";
import { CategoryItem } from "./business";
import { Type } from "@kit.ArkUI";

//断点工具类
@ObservedV2
export class AppBreakPoint {
  @Trace
  breakPoint: BreakPointEnum = BreakPointEnum.XS
}

export interface ResponseData<T> {
  code: string
  message: string
  result: T
}


@ObservedV2
export class AppCategory {
  @Trace
  category: CategoryItem[] = []
}

export interface UserInfo {
  token: string
  avatar: string
  nickname: string
  account: string
}

// 全局用户类型
@ObservedV2
export class HDMUser implements UserInfo {
  @Trace
  token: string = ''
  @Trace
  avatar: string = ''
  @Trace
  nickname: string = ''
  @Trace
  account: string = ''
  // constructor(model: UserInfo) {
  //   this.token = model.token
  //   this.avatar = model.avatar
  //   this.nickname = model.nickname
  //   this.account = model.account
  // }
}

// 又嵌套了一层对象 针对user进行整体赋值就简单了！！！
@ObservedV2
export class AppUser {
  //当缓存的对象为复杂数据类型时，需要@type装饰这个类 保证不丢失

  @Type(HDMUser)
  @Trace
  user: HDMUser = new HDMUser()
}