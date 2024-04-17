import { Hmpanel } from './components/HmPanel'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column({
      space: 20
    }) {
      Hmpanel({
        panelHeight: 200,
        color: Color.Green
      }) {
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap,
        }) {
          ForEach([1, 2, 3, 3, 4, 5, 6], (item: number) => {
            Button(item.toString())
          })
        }.margin(20)
        Progress({
          value: 20,
          total: 100
        })
      }
      Hmpanel({
        panelHeight: 100,
        color: Color.Yellow
      }) {

      }
    }
  }
}

