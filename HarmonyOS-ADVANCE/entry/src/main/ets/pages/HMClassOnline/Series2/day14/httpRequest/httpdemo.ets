import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';

class ApifoxModel {
  msg: string = ''
  code: number = 0
  data: string[] = []
}

@Entry
@Component
struct Httpdemo {
  @State message: string = 'Hello World';
  @State ApifoxModel1: ApifoxModel = {
    msg: "",
    code: 0,
    data: ['']
  }

  aboutToAppear(): void {
    this.gethttpdata()
  }

  async gethttpdata() {
    const httpobj = http.createHttp()
    const res = await httpobj.request('https://api-vue-base.itheima.net/api/joke/list?num=2')
    this.ApifoxModel1 = JSON.parse(res.result.toString())

  }

  build() {
    Row() {
      Column() {
        ForEach(this.ApifoxModel1.data, (item: string) => {
          Text(item)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}