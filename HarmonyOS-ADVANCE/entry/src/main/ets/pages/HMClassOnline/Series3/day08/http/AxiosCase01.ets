import axios, { AxiosResponse } from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';
import { preferences } from '@kit.ArkData';

@Entry
@Component
struct Axios {
  @State message: string = 'Hello World';
  async aboutToAppear():Promise<void>  {
    let res= await axios.get<object, AxiosResponse<object,null>>('https://zhousg.atomgit.net/harmonyos-next/takeaway.json')
    promptAction.showToast({message:JSON.stringify(res.data)})
  }
  build() {

    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

