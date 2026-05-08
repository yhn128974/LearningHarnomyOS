// deepseek的数据和我们平时请求的数据有什么区别
import { rcp } from "@kit.RemoteCommunicationKit"

// 推理模型-一个字一个字在推-记录当前的文本属于哪个上下文
// 接口一口气把所有的结果都给用户

export class DeepSeekRcp {
  session: rcp.Session | null = null // rcp的请求实例对象

  initSession() {
    this.session = rcp.createSession({})
  }

  // 发送问题给deepSeek
  postDeepSeek(data: object) {
    if (!this.session) {
      this.initSession()
    }

  }
}

export const deepSeekRcp = new DeepSeekRcp()