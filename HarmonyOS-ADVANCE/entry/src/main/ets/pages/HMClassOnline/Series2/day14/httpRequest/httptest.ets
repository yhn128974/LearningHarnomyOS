import http from '@ohos.net.http';
import axios, { AxiosResponse } from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';

interface foods {
  id: number,
  name: string,
  like_ratio_desc: string,
  month_saled: number,
  unit: string,
  food_tag_list: string[],
  price: number,
  picture: string,
  description: string,
  tag: string,
  count: number,
}

interface foodFeatures {
  tag: string,
  name: string,
  foods: foods[]
}

export class foodsModel implements foods {
  id: number = 0
  name: string = ''
  like_ratio_desc: string = ''
  month_saled: number = 0
  unit: string = ''
  food_tag_list: string[] = []
  price: number = 0
  picture: string = ''
  description: string = ''
  tag: string = ''
  count: number = 0

  constructor(model: foods) {
    this.id = model.id
    this.name = model.name
    this.like_ratio_desc = model.like_ratio_desc
    this.month_saled = model.month_saled
    this.unit = model.unit
    this.food_tag_list = model.food_tag_list
    this.price = model.price
    this.picture = model.picture
    this.description = model.description
    this.tag = model.tag
    this.count = model.count
  }
}

@Observed
export class foodFeaturesModel implements foodFeatures {
  tag: string = ''
  name: string = ''
  foods: foods[] = []

  constructor(model: foodFeatures) {
    this.tag = model.tag
    this.name = model.name
    this.foods = model.foods
  }
}

@Entry
@Component
struct Httptest {
  @State message: string = 'Hello World';
  @State foodList: foodFeaturesModel[] = []

  aboutToAppear(): void {
    this.getHTTPResponse()
  }

  async getHTTPResponse() {
    const request = http.createHttp()
    const response = await request.request('https://hmajax.itheima.net/api/weather',{
      extraData:{
        city:110100
      }
    }
    )
    promptAction.showToast({
      message: JSON.stringify(response.result)
    })
    // http 的数据存放在 response.result中

    // this.jock = JSON.parse(response.result.toString()) as string //有数据

    // let jock2: string = JSON.parse(JSON.stringify(response.result)) //无数据



    // this.foodList = JSON.parse(response.result.toString()) as foodFeaturesModel[]//有数据
    // this.foodList = JSON.parse(JSON.stringify(response.result)) as foodFeaturesModel[]//无数据

    // 请求完毕之后销毁http对象
    request.destroy()

  }

  // async testAxios() {
  //   const res: AxiosResponse = await axios.get<object, AxiosResponse<object>, null>('https://zhoushugang.gitee.io/fe2022/takeaway.json')
  //   // axios 的数据存放在 res.data中
  //   this.foodList = JSON.parse(res.data.toString()) as foodFeaturesModel[]
  //   this.foodList = res.data
  // }

  build() {
    Column() {
      Text('hello')
    }.padding(10)
  }
}