@Entry
@Component
struct Index {
  @State arr: Array<string>  = ['123','34545','4545','sdsdsd']
  build() {

    List({ space: 10 }) {
      ForEach(this.arr, (item:string) => {
        ListItem() {
          Text(`${item}`).height(300)
        }
      })
    }
    .onScrollIndex((firstIndex: number, lastIndex: number) => {
      console.info('first' + firstIndex)
      console.info('last' + lastIndex)
    })
    .onScroll((scrollOffset: number, scrollState: ScrollState) => {
      console.info('scrollOffset' + scrollOffset)
      console.info('scrollState' + scrollState)
    })
    .onReachStart(() => {
      console.info('onReachStart')
    })
    .onReachEnd(() => {
      console.info('onReachEnd')
    })
    .onScrollStop(() => {
      console.info('onScrollStop')
    })
    .layoutWeight(1)
  }
}


