import { promptAction } from '@kit.ArkUI'
import { author, httpClient, navPathStack } from '.'

import { AppUser, UserModel } from "../../models"

interface ClockRes {
  clockinNumbers: number
}

export const requestClockIn = async () => {
  const user: UserModel = author.getUserInfo()
  if (user.token) {
    if (user.clockinNumbers === 0) {
      const res = await httpClient.request<ClockRes>({ url: 'clockin', method: 'post' })
      user.clockinNumbers = res.clockinNumbers
      author.setUserInfo(user)
      promptAction.showToast({ message: '打卡成功' })
    }
    navPathStack.pushPath({
      name: 'ClockInPage'
    })
  } else {
    navPathStack.pushPath({
      name: 'LoginPage'
    })
  }
}