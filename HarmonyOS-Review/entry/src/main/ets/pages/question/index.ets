import { HcLoadingDialog, HcNavBar, HcTag } from '../../commons/components'
import { AreaHeight, QuestionItem } from '../../models'
import { AppStorageV2, componentSnapshot, promptAction } from '@kit.ArkUI'
import { navPathStack } from '../../commons/utils/navPathStack'
import { QuestionDetail } from '../../models/QuestionDetail'
import { apiGetQuesListDetail, apiQuestionOpt, QuestionOptParams } from '../../commons/utils/http/api'
import { JSON } from '@kit.ArkTS'
import { webview } from '@kit.ArkWeb'
import { QuestionPageParams } from '../../models/QuestionPageParams'
import { QuestionShareDialog } from './components/QuestionShareDialog'
import { tracking } from '../../commons/utils/Tarcking'


//
class TestObj {
  test() {
    promptAction.openToast({
      message: "hello"
    })
  }
}


@ComponentV2
export struct QuestionPage {
  @Local startTime: number = Date.now()
  @Local areaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => new AreaHeight(0, 0))!
  @Local initializeItem: QuestionItem = {} as QuestionItem
  @Local currentList: QuestionItem[] = []
  @Local currentQuestionDetail: QuestionDetail = {} as QuestionDetail
  @Local currentQuestionDetailList: QuestionDetail[] = []
  @Local currentIndex: number = 0
  // set CustomDialogController
  questionShareDialogController: CustomDialogController = new CustomDialogController({
    builder: QuestionShareDialog({
      item: this.currentQuestionDetail,
    }),
    customStyle: true,
    alignment: DialogAlignment.Center
  })
  //注册自定义弹框
  dialog = new CustomDialogController({
    builder: HcLoadingDialog({
      message: "updating...",
    }),
    customStyle: true,
    alignment: DialogAlignment.Center
  })
  //set WebviewController
  controller: WebviewController = new webview.WebviewController()
  //实例化js注入对象
  obj = new TestObj()

  @Monitor('currentQuestionDetail')
  updateWeb() {
    //如果下web页面已经展示出来但是数据还没有到的情况下重新刷新一些页面
    this.controller.loadUrl($rawfile('question.html'))
    this.dialog.close()
  }

  async questionOpt(optType: 1 | 2, flag: 0 | 1) {
    try {
      const data: QuestionOptParams = {
        id: this.currentQuestionDetail.id.toString(),
        type: 0,
        optType
      }
      // flag 是你要执行的操作 执行 | 取消
      // await httpClient.request<null, QuestionOptParams>({
      //   url: flag === 1 ? 'question/opt' : 'question/unOpt',
      //   method: 'post',
      //   data
      // })
      await apiQuestionOpt(flag, data)

      //
      if (optType === 1) {
        this.currentQuestionDetail.likeFlag = flag
        promptAction.showToast({ message: flag ? '点赞成功' : '取消点赞' })
      }
      if (optType === 2) {
        this.currentQuestionDetail.collectFlag = flag
        promptAction.showToast({ message: flag ? '收藏成功' : '取消收藏' })
      }
    } catch (e) {
      promptAction.showToast({ message: '操作失败' })
    }
  }

  //
  async aboutToAppear() {
    // get param from last page
    const param = navPathStack.getParamByName('QuestionPage').pop() as QuestionPageParams
    if (param) {
      this.initializeItem = param.item
      this.currentList = param.list
      //
      this.currentIndex = this.currentList.findIndex((item) => {
        return this.initializeItem.id == item.id
      })
    }
    await this.getCurrentQuestionDetail(param.item.id.toString())
  }

  async getCurrentQuestionDetail(id: string) {
    //open customDialog
    this.dialog.open()
    if (this.currentQuestionDetailList.findIndex((item) => {
      return item.id.toString() === id
    }) !== -1) {
      let index = this.currentQuestionDetailList.findIndex((item) => {
        return item.id.toString() === id
      })
      this.currentQuestionDetail = this.currentQuestionDetailList[index]
    } else {
      //
      try {
        this.currentQuestionDetail = await apiGetQuesListDetail(id)
        this.currentQuestionDetailList.push(this.currentQuestionDetail)
        // console.log('answer', this.currentQuestionDetail.answer)
      } catch (e) {
        console.log(JSON.stringify(e))
      }
    }

  }

  @Builder
  TitleBuilder(text: string) {
    Row() {
      Text()
        .width(2)
        .height(12)
        .backgroundColor($r('app.color.black'))
        .margin({ right: 13 })
      Text(text)
        .fontWeight(700)
    }
    .width('100%')
    .padding({ top: 10 })
    .height(32)
  }

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: this.currentQuestionDetail.likeFlag === 1 ? '取消点赞' : '点赞' })
        .onClick(() => this.questionOpt(1, this.currentQuestionDetail.likeFlag === 1 ? 0 : 1))
      MenuItem({ content: this.currentQuestionDetail.collectFlag === 1 ? '取消收藏' : '收藏' })
        .onClick(() => this.questionOpt(2, this.currentQuestionDetail.collectFlag === 1 ? 0 : 1))
      MenuItem({ content: '点我反馈' })
      MenuItem({ content: '试题分享' })
        .onClick(() => {
          this.questionShareDialogController.open()
        })
    }
    .width(108)
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column() {
        HcNavBar({ title: '试题详情', showRightIcon: false })
        // 题目
        this.TitleBuilder('题目:')
        Text(this.currentQuestionDetail.stem)
          .width('100%')
          .padding(16)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        //
        Row({ space: 12 }) {
          ForEach(this.currentQuestionDetail.stage, (item: string) => {
            HcTag({ text: item })
          })
          Blank()
          Image($r("app.media.ic_home_more"))
            .width(20)
            .aspectRatio(1)
            .bindMenu(this.MenuBuilder())
        }
        .width('100%')
        .padding({ bottom: 16, left: 16, right: 16 })

        Divider()
          .strokeWidth(8)
          .color($r('app.color.common_gray_bg'))
        // 内容
        this.TitleBuilder('答案：')
        // Text(this.currentQuestionDetail.answer)
        //   .layoutWeight(1)
        //   .padding(16)


        Web({
          src: $rawfile('question.html'),
          controller: this.controller,

        })//页面加载完毕，注入JS脚本
          .onPageEnd(() => {
            if (this.currentQuestionDetail.answer) {
              this.controller.runJavaScript(`writeHtml(\`${this.currentQuestionDetail.answer}\`)`)
            }
          })
          .layoutWeight(1)
          //给网页注入方法到window（窗口）对象中,可以被网页直接调用
          .javaScriptAccess(true)
          .javaScriptProxy({
            name: "ProxyObj",
            object: this.obj,
            methodList: ['test'], //方法对应对象内的方法
            controller: this.controller,
          })
        Row({ space: 80 }) {
          Row() {
            Image($r('sys.media.ohos_ic_public_arrow_left'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_01'))

            Text(' 上一题')
              .fontColor(this.currentIndex > 0 ? $r('app.color.common_gray_03') : $r('app.color.common_gray_01'))

          }
          .onClick(async () => {
            if (this.currentIndex > 0) {
              this.currentIndex--
              await this.getCurrentQuestionDetail(this.currentList[this.currentIndex].id.toString())
              //记录学习时间
              tracking.record(this.startTime, Date.now(), this.currentQuestionDetail.id.toString())
              //
              this.startTime = Date.now()
            } else {
              promptAction.openToast({
                message: "no more question"
              })
            }

          })

          Row() {
            Text('下一题 ')
              .fontColor(this.currentIndex < this.currentList.length ? $r('app.color.common_gray_03') :
                $r('app.color.common_gray_01'))

            Image($r('sys.media.ohos_ic_public_arrow_right'))
              .width(20)
              .aspectRatio(1)
              .fillColor($r('app.color.common_gray_03'))
          }
          .onClick(async () => {
            if (this.currentIndex < this.currentList.length - 1) {
              this.currentIndex++
              await this.getCurrentQuestionDetail(this.currentList[this.currentIndex].id.toString())
              //记录学习时间
              tracking.record(this.startTime, Date.now(), this.currentQuestionDetail.id.toString())
              //
              this.startTime = Date.now()
            } else {
              promptAction.openToast({
                message: "no more question"
              })
            }
          })
        }
        .height(44)
        .width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('100%')
      .padding({ bottom: this.areaHeight.voidAreaTopHeight })
    }
    .hideTitleBar(true)
    .onShown(() => {
      this.startTime = Date.now() //
    })
    .onHidden(() => {
      tracking.record(this.startTime, Date.now(), this.currentQuestionDetail.id.toString())
      tracking.report()
    })
  }
}

// 跳转页面入口函数
@Builder
export function QuestionBuilder() {
  QuestionPage()
}