@ObservedV2
export class AreaHeight {
  @Trace
  voidAreaTopHeight: number
  @Trace
  voidAreaBottomHeight: number

  constructor(topHeight: number, bottomHeight: number) {
    this.voidAreaTopHeight = topHeight
    this.voidAreaBottomHeight = bottomHeight
  }
}

