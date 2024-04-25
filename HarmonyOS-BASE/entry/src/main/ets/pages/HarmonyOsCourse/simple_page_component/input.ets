@Entry
@Component
struct Index {
  @State text: string = 'Hello World';
  build() {
    Row() {
      Column() {
       TextInput({placeholder: 'Hello World'})
         .caretColor(Color.Blue)
         .onChange((value)=>{
         this.text=value;
       })
        Text(this.text)
      }
      .width('100%')
    }
    .height('100%')
  }
}

