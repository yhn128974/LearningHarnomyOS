import { http } from '@kit.NetworkKit';
import { JSON } from '@kit.ArkTS';
import { promptAction } from '@kit.ArkUI';
import { dataResult, school } from './data';
import axios, { AxiosResponse } from '@ohos/axios'

@Entry
@ComponentV2
struct HttpPage {
  @Local currentSchool: string = '重庆交通大学';
  @Local message: dataResult = {
    code: 0,
    data: {} as school,
    msg: ''
  }

  aboutToAppear(): void {
    // this.getInfo('重庆交通大学')
    this.getInfoFromAxios('重庆交通大学')
  }

  //原生http.createHttp().request('url',{method:"",...},(err: BusinessError, data: http.HttpResponse)=>{})
  getInfo(school: string) {
    // 每一个httpRequest对应一个HTTP请求任务，不可复用
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      `https://api.52vmy.cn/api/query/daxue?daxue=${school}`,
      {
        method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        // header: [{
        //   'Content-Type': 'application/json'
        // }],
        //
        // // 当使用POST请求时此字段用于传递内容
        // extraData: "",
        // expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        // usingCache: true, // 可选，默认为true
        // priority: 1, // 可选，默认为1
        // connectTimeout: 60000, // 可选，默认为60000ms
        // readTimeout: 60000, // 可选，默认为60000ms
        // usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
        // usingProxy: false, // 可选，默认不使用网络代理，自API 10开始支持该属性
        // caPath: '/path/to/cacert.pem', // 可选，默认使用系统预制证书，自API 10开始支持该属性
        // clientCert: {
        //   // 可选，默认不使用客户端证书，自API 11开始支持该属性
        //   certPath: '/path/to/client.pem', // 默认不使用客户端证书，自API 11开始支持该属性
        //   keyPath: '/path/to/client.key', // 若证书包含Key信息，传入空字符串，自API 11开始支持该属性
        //   certType: http.CertType.PEM, // 可选，默认使用PEM，自API 11开始支持该属性
        //   keyPassword: "passwordToKey" // 可选，输入key文件的密码，自API 11开始支持该属性
        // },
        // multiFormDataList: [// 可选，仅当Header中，'content-Type'为'multipart/form-data'时生效，自API 11开始支持该属性
        //   {
        //     name: "Part1", // 数据名，自API 11开始支持该属性
        //     contentType: 'text/plain', // 数据类型，自API 11开始支持该属性
        //     data: 'Example data', // 可选，数据内容，自API 11开始支持该属性
        //     remoteFileName: 'example.txt' // 可选，自API 11开始支持该属性
        //   }, {
        //   name: "Part2", // 数据名，自API 11开始支持该属性
        //   contentType: 'text/plain', // 数据类型，自API 11开始支持该属性
        //   // data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt
        //   filePath: `${getContext(this).filesDir}/fileName.txt`, // 可选，传入文件路径，自API 11开始支持该属性
        //   remoteFileName: 'fileName.txt' // 可选，自API 11开始支持该属性
        // }
        // ]
      },
      (err: BusinessError, data: http.HttpResponse) => {
        if (!err) {
          // data.result为HTTP响应内容，可根据业务需要进行解析
          console.info('Result:' + JSON.stringify(data.result));

          this.message = JSON.parse(data.result.toString()) as dataResult

          console.info('code:' + JSON.stringify(data.responseCode));
          // data.header为HTTP响应头，可根据业务需要进行解析
          console.info('header:' + JSON.stringify(data.header));
          console.info('cookies:' + JSON.stringify(data.cookies)); // 8+
          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy();
        } else {
          console.error('error:' + JSON.stringify(err));
          // 取消订阅HTTP响应头事件
          httpRequest.off('headersReceive');
          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy();
        }
      }
    );
  }

  //三方库
  async getInfoFromAxios(school: string) {
    const res =
      await axios.get<dataResult, AxiosResponse<dataResult, null>>(`https://api.52vmy.cn/api/query/daxue?daxue=${school}`,
        {})
    this.message = res.data
  }

  build() {
    Column() {

      Row() {
        TextInput({
          text: this.currentSchool!!
        }).layoutWeight(1)

        Button('getSchoolInfo').onClick(() => {
          this.getInfo(this.currentSchool)
        }).type(ButtonType.Normal).borderRadius(5).width(100)
      }

      //北京大学
      Text(`${JSON.stringify(this.message.data.detail)}` ?? '数据加载中...').maxLines(5)
    }
  }
}