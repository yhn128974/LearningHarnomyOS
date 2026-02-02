import { Type } from "@kit.ArkUI"

export interface User {
  id: string
  username: string
  avatar: string
  token: string
  nickName?: string
  // 学习时长
  totalTime?: number
  // 打卡次数
  clockinNumbers?: number
}

//持久化本地的两个坑
//1.复杂数据类型需要@type处理，才能持久化到本地
//2.如果字段有null，尽量初始化一下，不然会报错
//数据中心，将来维护的对象内容
@ObservedV2
export class UserModel implements User {
  @Trace
  id: string = ''
  @Trace
  username: string = ''
  @Trace
  avatar: string = ''
  @Trace
  token: string = ''
  @Trace
  nickName?: string = ''
  // 学习时长
  @Trace
  totalTime?: number = 0
  // 打卡次数
  @Trace
  clockinNumbers?: number = 0
}

@ObservedV2
export class AppUser {
  // 对于复杂对象需要@Type修饰，确保反序列化成功，去掉@Type会反序列化值失败。
  @Type(UserModel)
  // 对于没有初值的类属性，经过@Type修饰后，需要手动保存，否则持久化失败。
  // 无法使用@Type修饰的类属性，必须要有初值才能持久化。
  @Trace
  user: UserModel = new UserModel()
}

export interface LoginParams {
  username: string
  password: string
}
