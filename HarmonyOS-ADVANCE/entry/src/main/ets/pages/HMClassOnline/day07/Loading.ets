// import LoadingCom ,{LoadingCom1 as Loading01} from './Components/HeimaLoading'
import * as AllLoading from './Components/HeimaLoading'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct LoadingProgressExample {
  // 页面刚进入获取数据,在等待的过程中获取数据 数据获取完毕进度条消失
  @State isShowLoading: boolean = true;
  @State progressNumber: number = 0;
  // 不需要state声明与响应式页面更新无关
  timerInterval: number = -1

  aboutToAppear(): void {

    setTimeout(() => {
      this.isShowLoading = false
      promptAction.showToast({ message: '钩子函数执行' })
    }, 3000)

    this.timerInterval = setInterval(() => {
      if (this.progressNumber === 100) {
        this.progressNumber = 0
      }
      this.progressNumber++
    }, 100)
  }

  aboutToDisappear(): void {
    clearInterval(this.timerInterval)
  }

  build() {
    Column({ space: 5 }) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      if (this.isShowLoading) {
        AllLoading.LoadingCom()
      }
      AllLoading.progressCom({ progressNumber: this.progressNumber })
      // AllLoading.LoadingCom1()

    }.width('100%').margin({ top: 5 })
  }
}