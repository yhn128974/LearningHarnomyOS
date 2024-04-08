// import { ZhiHuContent } from './components/ZhiHContent'
// import { ZhiFuHeader } from './components/ZhiHuHeader'


import { zhifuModel } from './moduls/ZhiHu'
import { ZhiFuHeader, ZhiHuContent } from './components'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State zhifuModelInfomation: zhifuModel[] = [
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
    }),
  ]

  build() {
    Row() {
      Column() {
        ZhiFuHeader()
        // Divider分隔器
        Divider().strokeWidth(3)
        Row(){
          Text('评论数50').fontColor('f1f2f3')
      }.width('100%').padding(10)
        List() {
          ForEach(this.zhifuModelInfomation, (item: zhifuModel, inex: number) => {
            ListItem() {
              ZhiHuContent({ commentItem: item })
            }
          })
        }
      }
      .width('100%')
    }

  }
}

