import { LengthMetrics, LengthMetricsUnit } from '@kit.ArkUI';

@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text('阶段选择').fontSize(20).fontWeight(700)
      //FLEX
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.Start,
        //flex布局的间隙
        space: {
          main: LengthMetrics.vp(10),
          cross: LengthMetrics.vp(10)
        }
      }) {
        Text('ArkUI').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUIa').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUI-AAA').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUI').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUI').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUI1234').padding(10).backgroundColor('#c6c6c6')
        Text('ArkUI').padding(10).backgroundColor('#c6c6c6')
      }.width('100%')



    }
    .height('100%')
    .width('100%')
  }
}