import { router } from '@kit.ArkUI';
import('sharedlibrary/src/main/ets/pages/Index')
@Entry
@Component
struct RouterBundleCase {
  @State message: string = 'RouterBundleCase';

  build() {
    Row() {
      Column() {
        Button('HSP')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            router.pushUrl({
              // @bundle:+模块名+包名+ets/路径...
              url:'@bundle:com.example.myapplication/sharedlibrary/ets/pages/Index'
            })
          })
        Button('HSP')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            router.pushNamedRoute({
              name:'hsp-test',
              params:{
                id:123456789
              }
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}