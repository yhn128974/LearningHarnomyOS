import { processSubscriber } from '../../utils/SubscriberClass';


@Entry
@Component
struct ProcessPage {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    processSubscriber.subscribe('appUpdate', (event) => {
      this.message = event
    })
  }

  build() {
    Column() {
      Text(this.message)
      Button('change widgetMessage')
        .onClick(() => {
          processSubscriber.publish('cardUpdate', 'time')
        })
    }
    .height('100%')
    .width('100%')
  }
}