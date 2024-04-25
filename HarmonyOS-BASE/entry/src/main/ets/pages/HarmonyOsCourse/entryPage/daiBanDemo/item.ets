@Component
export struct Item {
  @State message: string = 'Hello World';

  @Prop isfished: boolean ;
  @Prop mession: string;
  @Prop allFished: boolean = false;




  build() {

    Row() {
      if (this.isfished || this.allFished) {
        Image($r('app.media.fished')).width(30).margin({
          right: 10,
        })
        Text(this.mession)
      } else {
        Image($r('app.media.notfished')).width(30).margin({
          right: 10,
        })
        Text(this.mession).decoration({
          type: TextDecorationType.LineThrough,
        }).fontColor('#888')
      }
    }
    .onClick(() => {
      this.isfished = !this.isfished;

    })
    .margin(10)
    .border({

      width: {
        bottom: 1
      },

      style: {
        bottom: BorderStyle.Solid
      }
    })
    .width('100%')
    .padding(10)

  }
}

