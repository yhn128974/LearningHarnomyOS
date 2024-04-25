
@Component
export struct Title {
  @State message: string = '代办';
  @Link allFished:boolean;

  build() {


        Row(){
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold).textAlign(TextAlign.Start).margin(10)
          Button('全部已完成').onClick((event: ClickEvent) => {
            this.allFished=!this.allFished
          })
        }.justifyContent(FlexAlign.SpaceBetween).width('100%')


    }


}

