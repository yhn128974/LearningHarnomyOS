// import { ZhiHuContent } from './components/ZhiHContent'
// import { ZhiFuHeader } from './components/ZhiHuHeader'


import { zhifu, zhifuModel } from './moduls'
import { ZhiFuHeader, ZhiHuContent, ZhihuReplay } from './components'
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State message: string = 'Hello World';
  @State currrentInformation: zhifuModel = new zhifuModel({
    ImageUrl: 'app.media.ic_01_1',
    name: '周杰伦',
    text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
    address: '北京',
    dainzhanshu: 100,
    likeFlage: false
  });
  @State zhifuModelInfomation: zhifuModel[] = [
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦1',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦2',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦3',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦4',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
    new zhifuModel({
      ImageUrl: 'app.media.ic_01_1',
      name: '周杰伦5',
      text: '实打实大阿达大大阿萨法水电费地方顺丰到付水电费第三方',
      address: '北京',
      dainzhanshu: 100,
      likeFlage: false
    }),
  ]

  changeLike(item: zhifu) {
    item.likeFlage = !item.likeFlage
    if (item.likeFlage) {
      item.dainzhanshu++
    } else {
      item.dainzhanshu--
    }

    const index = this.zhifuModelInfomation.findIndex(obj => obj.name == item.name)
    this.zhifuModelInfomation[index] = new zhifuModel(item)


    // promptAction.showToast({
    //   message: '父组件的方法被调佣了'
    // })
    // console.log("" + this.zhifuModelInfomation.length)


  }

  AddItem(text: string) {
    this.zhifuModelInfomation.unshift(
      new zhifuModel({
        ImageUrl: 'app.media.ic_01_1',
        name: `周杰伦${this.zhifuModelInfomation.length}`,
        text: text,
        address: '北京',
        dainzhanshu: 100,
        likeFlage: false
      }),)
    this.scroller.scrollEdge(Edge.Top)
  }

  changeCurrentLike(item: zhifu) {
    item.likeFlage = !item.likeFlage
    if (item.likeFlage) {
      item.dainzhanshu++
    } else {
      item.dainzhanshu--
    }
    this.currrentInformation = new zhifuModel(item)

    // promptAction.showToast({
    //   message: '父组件的方法被调佣了'
    // })
    // console.log("" + this.zhifuModelInfomation.length)


  }

  build() {
    Row() {
      Column() {
        ZhiFuHeader()

        ZhiHuContent({
          commentItem: this.currrentInformation
        , test: () => {
            this.changeCurrentLike(this.currrentInformation)
          }
        })

        // Divider分隔器
        Divider().strokeWidth(3)
        Row() {
          Text(`评论${this.zhifuModelInfomation.length}`).fontColor('f1f2f3')
        }.width('100%').padding(10)

        List({ scroller: this.scroller }) {
          ForEach(this.zhifuModelInfomation,
            (item: zhifuModel) => {
              ListItem() {
                ZhiHuContent({
                  commentItem: item,
                  test: () => {
                    this.changeLike(item)
                  }
                })
              }
            }, (item: zhifuModel) => {
              // 根据item内部的内容生成唯一id
              return item.name.toString() + "_" + item.dainzhanshu.toString()
            })
        }.layoutWeight(1)

        ZhihuReplay({
          // 子组件的函数
          AddItem: (text: string) => {
            //   父组件的函数
            this.AddItem(text)

          }
        })
      }
      .width('100%')
    }

  }
}

