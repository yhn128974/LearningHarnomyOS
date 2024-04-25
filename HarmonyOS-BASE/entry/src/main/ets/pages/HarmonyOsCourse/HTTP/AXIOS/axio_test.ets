import axios, { AxiosError, AxiosResponse } from "@ohos/axios";

interface forecast {
  date: string,
  high: string,
  low: string,
  ymd: string,
  week: string,
  sunrise: string,
  sunset: string,
  aqi: string,
  fl: string,
  type: string,
  notice: string
}

interface yesterday {
  date: string,
  high: string,
  low: string,
  ymd: string,
  week: string,
  sunrise: string,
  sunset: string,
  aqi: string,
  fl: string,
  type: string,
  notice: string,
}

interface cityInfo {
  city: string,
  citykey: string,
  parent: string,
  updateTime: string,
}

interface data {
  shidu: string,
  pm25: number,
  pm10: number,
  quality: string,
  wendu: string,
  ganmao: string,
  forecast: forecast[],
  yesterday: yesterday

}

interface weatherINFO {
  message: string,
  status: number,
  date: string,
  time: string,
  cityInfo: cityInfo
  data: data
}


// 发送一个get请求（默认请求方式）
// axios.get<weatherINFO, AxiosResponse<weatherINFO>, null>('http://t.weather.sojson.com/api/weather/city/101030100')
//   .then((response: AxiosResponse<weatherINFO>) => {
//     console.info("result:" + JSON.stringify(response));
//   })
//   .catch((error: AxiosError) => {
//     console.error("result:" + error.message);
//   })


// 支持async/await用法
async function getUser() {
  try {

    const response: AxiosResponse<weatherINFO> = await axios.get<weatherINFO, AxiosResponse<weatherINFO>, null>('http://t.weather.sojson.com/api/weather/city/101030100');

    console.log(JSON.stringify(response));

  } catch (error) {
    console.error(JSON.stringify(error));
  }
}


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
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

