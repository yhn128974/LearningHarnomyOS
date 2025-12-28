import { HmCommentItem, HmNavBar } from './components';
import { HmReplyInput } from './components/HmReplyInput';
import { ReplyItemModel, commentList } from './data';
import { promptAction } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MainPage {
  @Local currentCommentList: ReplyItemModel[] = commentList
  scroll: Scroller = new Scroller()

  handleItemChange(item: ReplyItemModel) {
    item.likeFlag = !item.likeFlag
    if (item.likeFlag) {
      item.likeNum++
    } else {
      item.likeNum--
    }
  }

  handlePushComment(content: string) {
    promptAction.showToast({
      message: content
    })
    this.currentCommentList.unshift(new ReplyItemModel({
      id: Math.random(),
      avatar: 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png',
      author: '老潘',
      content,
      time: `${(new Date().getMonth() + 1).toString().padStart(2, "0")}-${new Date().getDate()
        .toString()
        .padStart(2, "0")}`,
      area: '北京',
      likeNum: 0,
      likeFlag: false
    }))

    this.scroll.scrollEdge(Edge.Top)
  }

  build() {
    Column() {
      HmNavBar({
        title: '评论回复'
      })
      HmCommentItem({
        item: this.currentCommentList[0],
        handleItemChange: () => {
          // this.handleItemChange(this.currentCommentList[0])
          promptAction.openToast({
            message: "hello"
          })
        }

      })
      Divider().strokeWidth(5)

      Row() {
        Text('回复数50').padding(10)
      }.width('100%')
      .border({
        width: {
          bottom: 1
        },
        color: '#ccc'
      })

      List({
        scroller: this.scroll
      }) {
        ForEach(
          this.currentCommentList,
          (item: ReplyItemModel) => {
            ListItem() {
              HmCommentItem({
                item,
                handleItemChange: () => {
                  //箭头函数的this总是指向自己，避免子组件在执行时候this被改变
                  this.handleItemChange(item)
                }
              })
            }
          },
          (item: ReplyItemModel) => item.id.toString())

      }.onReachEnd(() => {

      }).layoutWeight(1)

      HmReplyInput({
        lastId: this.currentCommentList.length + 1,
        //接受子组件的数据
        pushComment: (content: string) => {
          this.handlePushComment(content)
        }
      }) // 在此刻显示

    }.width('100%')
  }
}