import { AppStorageV2, PersistenceV2 } from "@kit.ArkUI"
import { AppUser, HDMUser, UserInfo } from "../viewmodels"

export class Auth {
  setUser(user: HDMUser) {
    // let appUser = AppStorageV2.connect(AppUser, () => new AppUser())!

    let appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    appUser.user = user
  }

  getUser() {
    // const appUser = AppStorageV2.connect(AppUser, () => new AppUser())!
    const appUser = PersistenceV2.connect(AppUser, () => new AppUser())!
    return appUser.user
  }
}

export const auth = new Auth()