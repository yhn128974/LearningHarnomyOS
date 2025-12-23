import { Footer, Header, Main } from '../../components/TuanComponents';

@Entry
@Component
struct customComponent {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Header()
      Main()
      Footer()
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

