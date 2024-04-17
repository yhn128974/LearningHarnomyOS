import { MeiTuanHeader } from '../../../../views/meituan/MeiTuanHeader'

import { MeiTuanFooter } from '../../../../views/meituan/MeiTuanFooter'

import {MeiTuanMain} from '../../../../views/meituan/MeiTuanMain'
@Entry
@Component
struct MeiTuan {
  @State message: string = 'Hello World';

  build() {
    Column() {
      MeiTuanHeader()

      MeiTuanMain()

      MeiTuanFooter()
    }
    .width('100%')
  }
}

