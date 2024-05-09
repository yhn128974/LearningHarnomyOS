import { Header } from './components/Header'
import { Content } from './components/Content'
import { Footer } from './components/Footer'

@Entry
@Component
struct PageDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Header()
        Content()
        Footer()
      }
      .width('100%')
    }
    .height('100%')
  }
}