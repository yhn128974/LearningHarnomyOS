@Entry
@Component
struct LinearLayout {
  @State message: string = 'Hello World';

  build() {
    Column({
      space: 20
    }) {

      RowLinearLayout()
      ColumnLinearLayout()
    }
  }
}

@Component
struct RowLinearLayout {
  build() {

    Row({
      space: 20
    }) {
      Box()
      Box()
      Box()
      Box()
    }
    .width('100%')
    .height(200)
    .border({
      width: 2,
      color: 'red',
      style: BorderStyle.Solid
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Top)

  }
}

@Component
struct ColumnLinearLayout {
  build() {
    //
    Column({
      space: 20
    }) {
      Box()
      Box()
      Box()
      Box()
    }
    .width('100%')
    .border({
      width: 2,
      color: 'red',
      style: BorderStyle.Solid
    })
    .layoutWeight(1)
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.End)

  }
}

@Component
struct Box {
  build() {
    Row() {
      Text('hello')
    }.width(50).height(50).border({
      width: 2
    })
  }
}