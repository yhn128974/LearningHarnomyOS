import { rcp } from "@kit.RemoteCommunicationKit"
import { JSON, util } from "@kit.ArkTS";
import { ChatCompletionChunk } from '../../../models/DeepSeekModel'
import { logger } from "..";

// const APIKey = $r('app.string.DeepSeepKey') // APIkey

const APIKey: string = 'dtw9_OnNBZbMDDKedzw2r8XAjaO-1QiODbDn4cgp5dEX7uZJOo5FZSLWR5Gr6xuSYhu8Kphom_uxlt28-2N2zQ'
// const url = $r('app.string.DeepSeepUrl') // 请求url地址
const url = "https://api.modelarts-maas.com/v1/chat/completions" // 请求url地址

//创建一个请求拦截器的类

class DeepSeekRcpRequest implements rcp.Interceptor {
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    // 注入token
    context.request.headers!.authorization = `Bearer ${APIKey}`; // 注入apikey
    return next.handle(context)
  }
}

@ObservedV2
export class DeepSeekRcp {
  // rcp的请求实例对象
  session: rcp.Session | null = null
  @Trace responseString: string[] = []

  initSession() {
    this.session = rcp.createSession({
      // 配置拦截器
      interceptors: [new DeepSeekRcpRequest()], // 注入token的拦截器
      // 接收二进制数据流
      requestConfiguration: {
        tracing: {
          httpEventsHandler: {
            // 接收数据
            onDataReceive: (buffer) => {
              // SSE数据
              // bf => Json
              // ArrayBuffer => Uint8Array
              const uin8 = new Uint8Array(buffer)
              // 解码器 =>
              const decoder = new util.TextDecoder()
              const str = decoder.decodeToString(uin8); // 输出结果
              logger.info(str) // interview8
              //

              let res = JSON.parse(JSON.stringify(JSON.parse(str) as ChatCompletionChunk)) as ChatCompletionChunk

              this.responseString.push(res.choices[0].message.content)
              // console.log(res.choices[0].message.content)

            }
          }
        }
      }
    })
  }


  // 发送问题给deepSeek
  postDeepSeek(data: object, callback?: (message: string, finished: boolean) => void) {
    if (!this.session) {
      this.initSession()
    }
    // 发送deepSeek请求 不能立刻渴望得到结果 内容推理 一个字一个字在推
    this.session?.post(url, data)
  }
}


export const deepSeekRcp = new DeepSeekRcp()