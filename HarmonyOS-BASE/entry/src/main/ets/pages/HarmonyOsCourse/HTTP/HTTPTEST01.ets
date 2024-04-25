import http from '@ohos.net.http';
let httpRequest = http.createHttp();

httpRequest.on('headersReceive', (header) => {
  console.info('header: ' + JSON.stringify(header));
});

let url= "http://t.weather.sojson.com/api/weather/city/101030100";

let promise = httpRequest.request(
  // 请求url地址
  url,
  {
    // 请求方式
    method: http.RequestMethod.GET,
    // 可选，默认为60s
    connectTimeout: 60000,
    // 可选，默认为60s
    readTimeout: 60000,
    // 开发者根据自身业务需要添加header字段
    header: {
      // 'Content-Type': 'application/json'
    }
  });

promise.then((data:http.HttpResponse) => {
  console.log("success"+JSON.stringify(data));
  // if (data.responseCode === http.ResponseCode.OK) {
  //
  //   console.info('Result:' + data.result);
  //   console.info('code:' + data.responseCode);
  // }
}).catch((err:http.HttpResponse ) => {
  console.info('error:' + JSON.stringify(err));
});





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


