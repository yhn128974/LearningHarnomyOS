
import { MeiTuanMain } from '../../../../../views/meituan/MeiTuanMain';


import { MeiTuanHeader } from '../../../../../views/meituan/MeiTuanHeader';

import { MeiTuanFooter } from '../../../../../views/meituan/MeiTuanFooter';
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

