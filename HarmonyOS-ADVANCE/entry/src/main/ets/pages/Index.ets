import { router } from '@kit.ArkUI';
import {GetFileList,CreateFileCase} from 'sharedlibrary'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        CreateFileCase()

        GetFileList()

        // Scroll() {
        //   Button('点击跳转').onClick((event: ClickEvent) => {
        //     router.pushUrl({ url: 'pages/Class/day09/HTTP' })
        //   })
        // }
      }
      .width('100%')
    }
    .height('100%')
  }
}