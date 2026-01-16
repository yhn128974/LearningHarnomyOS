import commonEventManager from '@ohos.commonEventManager'

class ProcessSubscriber {
  subscriber?: commonEventManager.CommonEventSubscriber
  publishCount: number = 0

  publish(eventType: string, data: string = '') {
    commonEventManager.publish(eventType, { data }, (err) => {
    })
  }

  subscribe(eventType: string, callback: (event: string) => void) {
    // 1.创建订阅者
    commonEventManager.createSubscriber({ events: [eventType] }, (err, data) => {
      if (err) {
        return console.log('logData:', '创建订阅者失败')
      }
      // 2.data是订阅者
      this.subscriber = data
      if (this.subscriber) {
        // 3.订阅事件
        commonEventManager.subscribe(this.subscriber, (err, data) => {
          if (err) {
            return console.log('logData:', '订阅者事件失败')
          }
          if (data.data) {
            callback(data.data)
          }
        })
      }
    })
  }
}

export const processSubscriber = new ProcessSubscriber()