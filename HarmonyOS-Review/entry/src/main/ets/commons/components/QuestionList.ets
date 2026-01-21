import { QuestionItemComp } from "."

@ComponentV2
export struct QuestionList {
  @Local isRefreshing: boolean = false
  //
  @Local isFinish: boolean = false
  @Local isLoading: boolean = false
  @Local list: number[] = new Array(10).fill(0)

  @Builder
  loadMoreBuilder() {
    if (this.isLoading) {
      Row() {
        LoadingProgress().width(20)
        Text('new data is loading...').fontColor(Color.Gray).fontSize(14)
      }.width('100%').justifyContent(FlexAlign.Center).height(75)
    } else if (this.isFinish) {
      Row() {
        Text('no more data now!').fontColor(Color.Gray).fontSize(14)
      }.width('100%').justifyContent(FlexAlign.Center).height(75)
    }


  }

  onload() {
    setTimeout(() => {
      let newList: number[] = new Array(10).fill(0)
      this.list.push(...newList)
      this.isLoading = false
      if (this.list.length >= 40) {
        this.isFinish = true
      }
    }, 1000)
  }

  build() {
    Column() {
      Refresh({
        refreshing: this.isRefreshing!!
      }) {
        List() {

          ForEach(new Array(10).fill(0), () => {
            ListItem() {
              QuestionItemComp({
                item: {
                  id: '100',
                  stem: '请说下ArkUI的容器组件有哪些？',
                  difficulty: 3,
                  likeCount: 23,
                  views: 423,
                  readFlag: 1
                }
              })
            }
          })

          ListItem() {
            this.loadMoreBuilder()
          }

        }.width('100%').height('100%').onReachEnd(() => {
          if (this.isLoading || this.isFinish) {
            return
          } else {
            this.isLoading = true
            //条用请求函数
            this.onload()
          }
        }).edgeEffect(EdgeEffect.None)
      }
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false
        }, 1000)
      })

    }

    //

  }
}

