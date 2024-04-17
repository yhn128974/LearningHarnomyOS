@Preview
@Component
export  struct LoadingCom {
  @State message: string = 'Hello World';

  build() {
    Column() {
      LoadingProgress()
    }

  }
}

@Component
export struct LoadingCom1 {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text('Loading...')
      LoadingProgress()
    }

  }
}


@Component
export  struct progressCom {
  @Prop progressNumber:number = 0;

  build() {
    Progress({ value: this.progressNumber, total: 100, type: ProgressType.Ring })
      .width(100).color(Color.Orange)
      .style({ strokeWidth: 20, status: ProgressStatus.PROGRESSING })
  }
}

export default LoadingCom
