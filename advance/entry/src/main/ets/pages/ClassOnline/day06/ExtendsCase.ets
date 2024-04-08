@Entry
@Component
struct ExtendsCase {
  @State message: string = 'Hello World';
  @State isenabled: boolean = true;

  build() {
    Row() {
      Column({
        space: 10
      }) {
        Text(this.message)
          .TextStyle(Color.Pink, this.isenabled)
        Button('点击禁用').onClick((event: ClickEvent) => {
          this.isenabled = !this.isenabled
        })
        TextInput({
          placeholder: '请输入用户名',

        }).stateStyles({
          normal: TextBorderNormal,
          focused: TextBorderPressStyle
        })
        TextInput({
          placeholder: '请输入密码',

        }).type(InputType.Password).stateStyles({
          normal: TextBorderNormal,
          focused: TextBorderPressStyle
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function TextStyle(backgroundColor: Color, Statenable: boolean) {
  .fontSize(50)
  .fontWeight(FontWeight.Bold)
  .backgroundColor(backgroundColor)
  .stateStyles({
    normal: TextBorderNormal,
    pressed: TextBorderPressStyle,
    disabled: TextBorderDisableStyle
  })
  .enabled(Statenable)
}

@Styles
function TextBorderNormal() {
  .border({
    width: 1,
    style: BorderStyle.Solid,
    color: Color.Black
  })
}

@Styles
function TextBorderPressStyle() {
  .border({
    width: 2,
    style: BorderStyle.Solid,
    color: Color.Green
  })

}

@Styles
function TextBorderDisableStyle() {
  .border({
    width: 2,
    style: BorderStyle.Solid,
    color: Color.Red
  })
  .backgroundColor(Color.Gray)

}
