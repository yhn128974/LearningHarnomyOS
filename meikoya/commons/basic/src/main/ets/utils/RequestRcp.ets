import { rcp } from '@kit.RemoteCommunicationKit'
import { GlobalVariable } from '../constants'
import { ResponseData } from '../viewmodels'
import { promptAction } from '@kit.ArkUI'


class RcpRequestInterceptor implements rcp.Interceptor {
  // context上下文 -请求上下文
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // to from next(必须要执行的函数)
    // next传递到下一个
    // throw new Error("Method not implemented.");
    // axios返回类型无法更改！！！
    // 请求拦截器
    if (typeof context.request.content === 'object') {
      context.request.content =
        JSON.parse(JSON.stringify(context.request.content).replace(/__ob_/g, "")) as rcp.RequestContent
    }

    // TODO 注入token
    return next.handle(context) // 将结构返回下一个执行链

  }
}

class RcpResponseInterceptor implements rcp.Interceptor {
  // context上下文 -请求上下文
  async intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // to from next(必须要执行的函数)
    // next传递到下一个
    // throw new Error("Method not implemented.");
    // axios返回类型无法更改！！！
    // 请求拦截器
    const res = await next.handle(context) // 将结构返回下一个执行链
    // TODO 处理401异常问题
    // if(res.statusCode === 401) {
    //
    // }
    return res
  }
}

const instance = rcp.createSession({
  //baseurl
  baseAddress: GlobalVariable.BASE_URL,
  interceptors: [
    //请求拦截
    new RcpRequestInterceptor(),
    //响应拦截
    new RcpResponseInterceptor()
  ],
  requestConfiguration: {
    transfer: {
      timeout: {
        connectMs: GlobalVariable.TIME_OUT,
        transferMs: GlobalVariable.TIME_OUT,
        inactivityMs: GlobalVariable.TIME_OUT,
      }
    }
  }

})


export class RequestRcp {
  //
  static get<T>(url: string, params?: object): Promise<T> {

    return RequestRcp.toRightData<T>(instance.get(url + "?" + RequestRcp.transJSONToParams(params)))

  }

  static post<T>(url: string, data?: object): Promise<T> {
    return RequestRcp.toRightData<T>(instance.post(url, data))
  }

  // delete 支持传body参数 删除购物车需要传递body参数
  static delete<T>(url: string, params?: object, data?: object): Promise<T> {
    const req = new rcp.Request(url + "?" + RequestRcp.transJSONToParams(params), "DELETE", {}, data)
    return RequestRcp.toRightData<T>(instance.fetch(req))
    // return RequestRcp.toRightData<T>(instance.delete(url + "?" + RequestRcp.transJSONToParams(params)))
  }

  static put<T>(url: string, data?: object): Promise<T> {
    return RequestRcp.toRightData<T>(instance.put(url, data))
  }

  static patch<T>(url: string, data?: object): Promise<T> {
    const req = new rcp.Request(url, "PATCH", {}, data)
    return RequestRcp.toRightData<T>(instance.fetch(req))
  }

  static upload<T>() {
  }

  static download<T>() {

  }

  // 将数据转化成正确的数据类型
  static async toRightData<T>(res: Promise<rcp.Response>) {
    const obj = await res
    const result = obj.toJSON() as ResponseData<T>
    if (result.code === GlobalVariable.SUCCESS_CODE) {
      return result.result
    }
    promptAction.showToast({ message: result.message })
    return Promise.reject(new Error(result.message))

  }

  // 转化json=> url地址参数的方法 { id: 1, name: 2 } => id=1&name=2
  static transJSONToParams(params?: object) {
    if (params) {
      return Object.keys(params).filter(key => !!params[key]).map(key => `${key}=${params[key]}`).join("&")
    }
    return ""
    // ["id","name"] => ["id=1", "name=2"]

  }
}

