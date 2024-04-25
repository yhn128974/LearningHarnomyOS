
@Component
export struct TitleComponent {
  @State message: string = 'Hi this is the test message.';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
    }

  }

  aboutToAppear(): void {
    console.log('title aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('title aboutToDisapp')
  }

  onPageShow(): void {
    console.log('title onPageShow')
  }
  onPageHide(): void {
    console.log('title onPageHide ')
  }
}

