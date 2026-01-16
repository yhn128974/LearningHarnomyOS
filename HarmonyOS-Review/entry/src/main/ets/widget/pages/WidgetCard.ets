const localStorage = new LocalStorage()

@Entry(localStorage)
@Component
struct WidgetCard {
  @LocalStorageProp('time') time: number = 0
  /*
   * The title.
   */
  readonly title: string = 'Hello World';
  /*
   * The action type.
   */
  readonly actionType: string = 'router';
  /*
   * The ability name.
   */
  readonly abilityName: string = 'EntryAbility';
  /*
   * The message.
   */
  readonly message: string = 'add detail';
  /*
   * The width percentage setting.
   */
  readonly fullWidthPercent: string = '100%';
  /*
   * The height percentage setting.
   */
  readonly fullHeightPercent: string = '100%';

  aboutToAppear(): void {

  }

  build() {
    Row() {
      Column() {
        Text(this.title)
      }.width('100%').height('100%')

    }

    .onClick(() => {
      postCardAction(this, {
        action: this.actionType,
        abilityName: this.abilityName,
        params: {
          
          message: this.message
        }
      });
    })
  }
}