@Component
struct Header {
  build() {
    Row() {
      Text('HELLO')
    }.width('100%').height(50).backgroundColor(Color.Grey)
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text('MAIN')
    }.width('100%')
    .layoutWeight(1)
    .backgroundColor('#ccc')
  }
}

@Component
struct Footer {
  build() {
    Row() {
      Text('FOOTER')
    }.width('100%').height(50).backgroundColor(Color.Orange)
  }
}

export {
  Header, Main, Footer
}