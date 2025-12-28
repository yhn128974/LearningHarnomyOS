@Entry
@Component
struct RelativePage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      RelativeContainer() {
        RelativeContainer() {

        }.width(100).height(100).backgroundColor(Color.Orange)
        .alignRules({
          middle: {
            anchor: '__container__',
            align: HorizontalAlign.Center
          }
        })

        RelativeContainer() {

        }
        .margin({
          left: 10
        })
        .width(100)
        .height(100)
        .backgroundColor(Color.Red)
        .alignRules({
          left: {
            anchor: '__container__',
            align: HorizontalAlign.Start
          },
          center: {
            anchor: '__container__',
            align: VerticalAlign.Center
          }
        })
        .id('redBox')

        RelativeContainer() {

        }.width(100).height(100).backgroundColor(Color.Blue)
        .alignRules({
          right: {
            anchor: '__container__',
            align: HorizontalAlign.End
          },
          center: {
            anchor: '__container__',
            align: VerticalAlign.Center
          }
        })

        RelativeContainer() {

        }.width(100).height(100).backgroundColor(Color.Green)
        .alignRules({
          top: {
            anchor: 'redBox',
            align: VerticalAlign.Bottom,
          },
          left: {
            anchor: "redBox",
            align: HorizontalAlign.End
          }

        })
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Pink)
      .alignRules({
        //1.自己的上中下 top center bottom
        top: {
          anchor: '__container__', //参照物相对于父亲
          //对齐参照物的那个部分
          align: VerticalAlign.Top

        },
        //2.自己的左中右 left middle right
        middle: {
          anchor: "__container__",
          align: HorizontalAlign.Center
        }
      })
      .width(300)
      .height(300)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Orange)
  }
}