import axios from '@ohos/axios'

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

  build() {

  }
}