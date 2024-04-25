import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'

interface NewResponse {
  message: string
  data: News[]
}

interface News {

  id: number,
  title: string,
  source: string,
  cmtcount: number,
  img: string,
  time: string
}

@Entry
@Component
struct HttpRequest {
  @State newList: News[] = [
    {
      "id": 1,
      "title": "5G渗透率持续提升，创新业务快速成长",
      "source": "新京报经济新闻",
      "cmtcount": 58,
      "img": "http://ajax-api.itheima.net/images/0.webp",
      "time": "2222-10-28 11:50:28"
    },
  ]

  aboutToAppear(): void {
    this.getinfo()
  }

  async getinfo() {
    let response: AxiosResponse<NewResponse> = await axios.get<NewResponse, AxiosResponse<NewResponse>, null>('http://hmajax.itheima.net/api/news')
    let res: NewResponse = JSON.parse(JSON.stringify(response.data))
    this.newList = res.data
    promptAction.showToast({ message: JSON.stringify(res.data) })
    // console.log(JSON.stringify(res.data));
  }

  build() {
    Column() {
      List() {
        ForEach(this.newList, (item: News, index: number) => {
          ListItem() {
            Column({
              space: 10
            }) {
              Image(item.img).width(200)
              Text(item.title)
            }
          }

        })
      }

    }

  }
}