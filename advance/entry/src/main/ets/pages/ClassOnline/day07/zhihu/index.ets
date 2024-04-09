// import { ZhiHuContent } from './components/ZhiHContent'
// import { ZhiFuHeader } from './components/ZhiHuHeader'


import { zhifuModel, zhifu } from './moduls'
import { ZhiFuHeader, ZhiHuContent } from './components'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State zhifuModelInfomation: zhifu[] = [
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
    {
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    },
  ]

  build() {
    Row() {
      Column() {
        ZhiFuHeader()
        ZhiHuContent({ commentItem: this.zhifuModelInfomation[0] })
        // Divider分隔器
        Divider().strokeWidth(3)
        Row() {
          Text(`评论${this.zhifuModelInfomation.length}`).fontColor('f1f2f3')
        }.width('100%').padding(10)

        List() {
          ForEach(this.zhifuModelInfomation, (item: zhifuModel, inex: number) => {
            ListItem() {
              ZhiHuContent({ commentItem: item })
            }
          })
        }.layoutWeight(1)
      }
      .width('100%')
    }

  }
}

