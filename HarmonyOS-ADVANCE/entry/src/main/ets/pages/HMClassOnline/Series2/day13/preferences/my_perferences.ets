import preferences from '@ohos.data.preferences'

export class TokenManager {
  static async getStore(context?: Context) {
    // 上下文 如果是在页面中调用 getContext
    // 1 在页面中调用 2. ability中调用（不能使用getContext()  因为此时页面还没初始化呢）
    return await preferences.getPreferences(context || getContext(), "token_store")
  }

  static async setToken(token: string, context?: Context) {
    const store = await TokenManager.getStore(context)
    store.putSync("my_token", token) // 同步写入内容
    // 写入磁盘
    await store.flush()
  }

  static async getToken(context?: Context) {
    const store = await TokenManager.getStore(context)

    return store.getSync("my_token", "") as string
  }
}

