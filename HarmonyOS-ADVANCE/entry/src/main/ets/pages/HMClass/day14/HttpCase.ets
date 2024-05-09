import http from '@ohos.net.http'
import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'

interface Joke {
  message: string,
  code: number,
  data: string[]
}

interface CityResponse {
  message: string,
  list: string[]
}

const req = http.createHttp()

@Entry
@Component
struct HttpCase {
  @State pname: string = '湖北省'
  @State jokeNumber: string = '1';
  @State cities: Array<string> = []
  @State jokes: Array<string> = []
  @State refreshing: Boolean = false
  @State isLoadingMore: boolean = false

  BaseAxiosReq() {
    return axios.create({
      baseURL: 'https://api-vue-base.itheima.net/api/joke/list',

    })
  }

  async getMoreJokeMssage() {
    let req = this.BaseAxiosReq()
    // res.data as Joke
    // req<响应类型, AxiosResponse<响应类型>, data提交类型>
    const res: AxiosResponse<Joke> = await req<Joke, AxiosResponse<Joke>, null>({
      method:http.RequestMethod.GET,
      params: {
        num: this.jokeNumber
      },
    })
    this.jokes.push(...res.data.data)

  }

  build() {
    Column() {
      Refresh({ refreshing: $$this.refreshing }) {
        Column() {
          Row() {
            TextInput({
              placeholder: "笑话个数",
              text: $$this.jokeNumber
            }).layoutWeight(1).type(InputType.Number)
            Button('获取信息').onClick((event: ClickEvent) => {
              req.request(`https://api-vue-base.itheima.net/api/joke/list`, {
                method: http.RequestMethod.GET,
                extraData: {
                  num: this.jokeNumber
                }
              }).then(res => {
                let JokeModel = JSON.parse(res.result.toString()) as Joke

                this.jokes = JokeModel.data
              })
            })
          }.width('100%')

          List() {
            ForEach(this.jokes, (item: string) => {
              ListItem() {
                Column() {
                  Text(item).width('100%')
                  Divider()
                }

              }

            })

          }.width('100%').onReachEnd(() => {
            if (!this.isLoadingMore) {
              this.isLoadingMore = true
              this.getMoreJokeMssage()
              this.isLoadingMore = false
            }

          })
        }

      }.onRefreshing(() => {
        req.request(`https://api-vue-base.itheima.net/api/joke/list?num=${this.jokeNumber}`).then(res => {
          let JokeModel = JSON.parse(res.result.toString()) as Joke
          this.jokes = JokeModel.data
          this.refreshing = false
        })
      })

      // Divider()
      //   .color(Color.Black)
      //   .strokeWidth(3)
      //
      // Column() {
      //   Row() {
      //     TextInput({
      //       placeholder: "请输入查询的省份",
      //       text: $$this.pname
      //     }).layoutWeight(1)
      //     Button('获取信息').onClick((event: ClickEvent) => {
      //       req.request(`http://hmajax.itheima.net/api/city?pname=${encodeURIComponent(this.pname)}`).then(res => {
      //         let cityInfo = JSON.parse(res.result.toString()) as CityResponse
      //         AlertDialog.show({
      //           message: JSON.stringify(cityInfo.list)
      //         })
      //         this.cities = cityInfo.list
      //       })
      //     })
      //   }
      //
      //   Grid() {
      //     ForEach(this.cities, (item: string) => {
      //       GridItem() {
      //         Text(item)
      //       }
      //     })
      //   }.width('100%').columnsTemplate('1fr '.repeat(4)).columnsGap(10).rowsGap(10)
      // }

    }.padding(20)
  }
}