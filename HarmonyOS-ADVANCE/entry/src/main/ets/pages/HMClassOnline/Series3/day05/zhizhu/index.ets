import { ZhiHu, ZhiHuModel } from './models/zhuhumodel'
import { ZhiHuList, HmReplyInput } from './compoments'


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State HeaderMessage: ZhiHuModel = new ZhiHuModel({
    image: $r('app.media.weichat'),
    title: 'abc',
    text: 'asfsffdfdfd',
    date: '10-9',
    address: '北京',
    isClick: false,
    clickNumber: 100
  ,
  })
  @StorageProp('MessageList') MessageList: ZhiHuModel[] = []

  aboutToAppear(): void {
    let MessageList: ZhiHuModel[] = [
      new ZhiHuModel({
        image: $r('app.media.weichat'),
        title: 'abc',
        text: 'asfsffdfdfd',
        date: '10-9',
        address: '北京',
        isClick: false,
        clickNumber: 100
      ,
      }),
      new ZhiHuModel({
        image: $r('app.media.weichat'),
        title: 'abc',
        text: 'asfsffdfdfd',
        date: '10-9',
        address: '北京',
        isClick: false,
        clickNumber: 100
      ,
      }),
      new ZhiHuModel({
        image: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
        title: '柱子哥',
        text: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
        date: '10-9',
        address: '旧金山',
        isClick: false,
        clickNumber: 29
      ,
      })
    ]
    AppStorage.setOrCreate('MessageList', MessageList)
  }

  putMessage(content: string) {
    let newMessageList: ZhiHuModel = new ZhiHuModel({
      image: $r('app.media.weichat'),
      title: 'abc',
      text: content,
      date: '10-9',
      address: '北京',
      isClick: false,
      clickNumber: 100
    })
    this.MessageList.unshift(newMessageList)
  }

  build() {
    Column() {
      Stack() {
        Row() {
          Row() {
            Image($r('app.media.ic_public_left_arrow'))
              .width(15)
              .aspectRatio(1)
          }
          .borderRadius(15)
          .backgroundColor('#eee')
          .width(30)
          .aspectRatio(1)
          .margin({
            left: 20,
          })
          .justifyContent(FlexAlign.Center)
          .stateStyles({
            pressed: {
              .backgroundColor('#ccc')
            }
          })
        }
        .justifyContent(FlexAlign.Start)
        .height(50)
        .width('100%')
        .zIndex(2)


        Row() {
          Text('评论回复')
        }
        .width('100%').justifyContent(FlexAlign.Center)
        .height(50)
      }.width('100%').height(50)

      Divider()
      ZhiHuList({
        item: this.HeaderMessage,

      })


      Divider().strokeWidth(6)
      Row() {
        Text(`回复数${this.MessageList.length}`).padding(10)
      }.height(50).width('100%')


      List() {
        ForEach(this.MessageList, (item: ZhiHuModel) => {
          ListItem() {
            ZhiHuList({
              item: item,

            })
          }
        })
      }.layoutWeight(1)

      HmReplyInput({
        putMessage: (content: string) => {
          this.putMessage(content)
        }
      })

    }

  }
}

