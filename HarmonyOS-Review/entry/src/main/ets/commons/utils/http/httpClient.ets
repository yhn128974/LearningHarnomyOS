import axios, {
  AxiosError,
  AxiosInstance,
  AxiosRequestConfig,
  AxiosResponse,
  InternalAxiosRequestConfig,
} from '@ohos/axios'
import { author, navPathStack } from '..'
import { UserModel } from '../../../models/User'
import { promptAction } from '@kit.ArkUI'

export const baseURL = 'https://api-harmony-teach.itheima.net/hm/'

//创建实例
const instance: AxiosInstance = axios.create({
  baseURL,
  timeout: 30000,
})

//配置请求/响应拦截器
instance.interceptors.response.use((res: AxiosResponse) => {
  if (res.data.code === 10000) {
    return res.data.data
  }
  //如果状态码不对不走成功的逻辑,抛出一个错误的Promise,将整个后台的响应都传递
  return Promise.reject(res.data)
}, (err: AxiosError) => {
  if (err.response?.status === 401) {
    //token失效,存储在本地的信息要移除
    author.setUserInfo({} as UserModel)
    promptAction.openToast({
      message: "登录状态失效"
    })
    navPathStack.pushPath({
      name: "LoginPage"
    }, {
      launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON//将该页移动到栈顶
    })
  }
  return Promise.reject(err)
})


//config: InternalAxiosRequestConfig （请求头）
//interceptors.request 请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  const user = author.getUserInfo()
  if (user.token) {
    config.headers.Authorization = `Bearer ${user.token}`
  }
  return config
}, (err: AxiosError) => {
  return Promise.reject(err)
})

//封装到类中，二次包装在导出(处理泛型传参)
class HttpClient {
  //Req=object表示请求对象是一个对象类型
  request<Res, Req = object>(config: AxiosRequestConfig<Req>) {
    return instance.request<Res, Res, Req>(config)
  }
}

export const httpClient = new HttpClient()


