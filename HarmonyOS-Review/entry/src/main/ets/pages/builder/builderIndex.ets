import { ListItemWithBuider } from './buiderCom/comInBuider';

@Entry
@Component
struct BuilderIndex {
  @State message: string = 'Hello World';

  build() {
    Column() {
      ListItemWithBuider()
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Orange)
  }
}