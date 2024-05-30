import http from '@ohos.net.http';
import router from '@ohos.router';

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

let serverData: weatherINFO

function get_http_url() {
  let httpRequest = http.createHttp()

  httpRequest.request(
    'http://t.weather.sojson.com/api/weather/city/101030100', {
    method: http.RequestMethod.GET,
    extraData: {
      // 'param1': "value"
    },
    connectTimeout: 1000,
    readTimeout: 1000,

  }).then((res: http.HttpResponse) => {

    console.log('sucessful response:')
    let result = `${res.result}`;
    let resultJson: weatherINFO = JSON.parse(result);


    console.log(""+resultJson);

  }).catch((err: http.HttpResponse) => {
    console.log('error response:')
    console.log(JSON.stringify(err));
  })
}

get_http_url()

@Entry
@Preview({
  title: 'Component1' , //预览组件的名称
  deviceType: 'phone',  //指定当前组件预览渲染的设备类型，默认为Phone
  width: 1080,  //预览设备的宽度，单位：px
  height: 2340,  //预览设备的长度，单位：px
  colorMode: 'light',  //显示的亮/暗模式，取值为light或dark
  dpi: 480,  //预览设备的屏幕DPI值
  locale: 'zh_CN',  //预览设备的语言，如zh_CN、en_US等
  orientation: 'portrait',  //预览设备的横竖屏状态，取值为portrait或landscape
  roundScreen: false  //设备的屏幕形状是否为圆形
})
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






