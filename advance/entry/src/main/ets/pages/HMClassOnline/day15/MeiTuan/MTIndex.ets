import MTBottom from './components/MTBottom'
import MTMain from './components/MTMain'
import MTTop from './components/MTTop'

@Entry
@Component
struct MTIndex {
  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          MTTop()
          MTMain()
        }
        .height("100%").width('100%')

        MTBottom()
      }.layoutWeight(1)
    }
    .width('100%')
    .height("100%")
    .backgroundColor($r("app.color.white"))
  }
}