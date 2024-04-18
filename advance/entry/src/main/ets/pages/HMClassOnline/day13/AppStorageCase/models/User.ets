 export  interface User {
  username: string;
  userpassword: string
  userage: number;
  userAvatar: string;

}

export class UserModel implements User {
  username: string = ''
  userpassword: string = ''
  userage: number = 0
  userAvatar: string = ''

  constructor(model: User) {
    this.username = model.username
    this.userpassword = model.userpassword
    this.userage = model.userage
    this.userAvatar = model.userAvatar
  }
}
