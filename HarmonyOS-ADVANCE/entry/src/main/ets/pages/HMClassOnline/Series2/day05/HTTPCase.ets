import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI';



interface Winderinfo {
  message: string,
  status: number,
  date: string,
  time: string,
  cityInfo: cityInfo,
  data: WinderData
}

interface cityInfo {
  city: string,
  citykey: string,
  parent: string,
  updateTime: string
}

interface forecasts {
  date: string,
  high: string,
  low: string,
  ymd: string,
  week: string,
  sunrise: string,
  sunset: string,
  aqi: number,
  fx: string,
  fl: string,
  type: string,
  notice: string
}

interface yesterday {
  date: string
  high: string,
  low: string,
  ymd: string,
  week: string,
  sunrise: string,
  sunset: string,
  aqi: number,
  fx: string,
  fl: string,
  type: string,
  notice: string
}

interface WinderData {
  shidu: string,
  pm25: number,
  pm10: number,
  quality: string,
  wendu: string,
  ganmao: string,
  forecast: forecasts,
  yesterday: yesterday
}


@Entry
@Component
struct HttpCase {
  @State message: string = 'Hello World';



  aboutToAppear(): void {
this.getData()
  }

  async getData() {
    const result = await axios.get<WinderinfoModel, AxiosResponse<WinderinfoModel, null>>("http://t.weather.sojson.com/api/weather/city/101030100")
    promptAction.showToast({ message: JSON.stringify(result.data.data.quality) })



    // // axios自己有一层封装
    // return  result.data.data
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("测试请求")
          .onClick(() => {
            this.getData()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

export class WinderinfoModel implements Winderinfo {
  message: string = ''
  status: number = 0
  date: string = ''
  time: string = ''
  cityInfo: cityInfo = new cityInfoModel({} as cityInfo)
  data: WinderData = new WinderDataModel({} as WinderData)

  constructor(model: Winderinfo) {
    this.message = model.message
    this.status = model.status
    this.date = model.date
    this.time = model.time
    this.cityInfo = model.cityInfo
    this.data = model.data
  }
}
export class cityInfoModel implements cityInfo {
  city: string = ''
  citykey: string = ''
  parent: string = ''
  updateTime: string = ''

  constructor(model: cityInfo) {
    this.city = model.city
    this.citykey = model.citykey
    this.parent = model.parent
    this.updateTime = model.updateTime
  }
}
export class forecastsModel implements forecasts {
  date: string = ''
  high: string = ''
  low: string = ''
  ymd: string = ''
  week: string = ''
  sunrise: string = ''
  sunset: string = ''
  aqi: number = 0
  fx: string = ''
  fl: string = ''
  type: string = ''
  notice: string = ''

  constructor(model: forecasts) {
    this.date = model.date
    this.high = model.high
    this.low = model.low
    this.ymd = model.ymd
    this.week = model.week
    this.sunrise = model.sunrise
    this.sunset = model.sunset
    this.aqi = model.aqi
    this.fx = model.fx
    this.fl = model.fl
    this.type = model.type
    this.notice = model.notice
  }
}
export class yesterdayModel implements yesterday {
  date: string = ''
  high: string = ''
  low: string = ''
  ymd: string = ''
  week: string = ''
  sunrise: string = ''
  sunset: string = ''
  aqi: number = 0
  fx: string = ''
  fl: string = ''
  type: string = ''
  notice: string = ''

  constructor(model: yesterday) {
    this.date = model.date
    this.high = model.high
    this.low = model.low
    this.ymd = model.ymd
    this.week = model.week
    this.sunrise = model.sunrise
    this.sunset = model.sunset
    this.aqi = model.aqi
    this.fx = model.fx
    this.fl = model.fl
    this.type = model.type
    this.notice = model.notice
  }
}
export class WinderDataModel implements WinderData {
  shidu: string = ''
  pm25: number = 0
  pm10: number = 0
  quality: string = ''
  wendu: string = ''
  ganmao: string = ''
  forecast: forecasts = new forecastsModel({} as forecasts)
  yesterday: yesterday = new yesterdayModel({} as yesterday)

  constructor(model: WinderData) {
    this.shidu = model.shidu
    this.pm25 = model.pm25
    this.pm10 = model.pm10
    this.quality = model.quality
    this.wendu = model.wendu
    this.ganmao = model.ganmao
    this.forecast = model.forecast
    this.yesterday = model.yesterday
  }
}
