export interface LoginForm {
  account: string
  password: string
}

@ObservedV2
export class LoginFormModel implements LoginForm {
  @Trace
  account: string = ''
  @Trace
  password: string = ''

  constructor(model: LoginForm) {
    this.account = model.account
    this.password = model.password
  }
}
