export  interface UserInfo {
  id: number,
  avatar: ResourceStr,
  phone: number,
  passWord: string,
  email: string,
  nickName: string
}

export class UserInfoModel implements UserInfo {
  id: number = 0
  avatar: ResourceStr = ''
  phone: number = 0
  passWord: string = ''
  email: string = ''
  nickName: string = ''

  constructor(model: UserInfo) {
    this.id = model.id
    this.avatar = model.avatar
    this.phone = model.phone
    this.passWord = model.passWord
    this.email = model.email
    this.nickName = model.nickName
  }
}
