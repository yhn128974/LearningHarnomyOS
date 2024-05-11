@Entry
@Component
struct Index {
  @State isClick: boolean = false
  @State canUsed: boolean = false

  build() {

    Column() {

      Stack() {
        Row() {
          Row() {
            Image($r('app.media.ic_public_left_arrow'))
              .width(15)
              .aspectRatio(1)
          }
          .borderRadius(15)
          .backgroundColor('#eee')
          .width(30)
          .aspectRatio(1)
          .margin({
            left: 20,
          })
          .justifyContent(FlexAlign.Center)
          .stateStyles({

            pressed: {
              .backgroundColor('#ccc')
            }
          })
        }
        .justifyContent(FlexAlign.Start)
        .height(50)
        .width('100%')
        .zIndex(2)


        Row() {
          Text('评论回复')
        }
        .width('100%').justifyContent(FlexAlign.Center)
        .height(50)
      }.width('100%').height(50)

      Divider()

      Row() {
        Column() {
          Image($r('app.media.weichat')).width(100).aspectRatio(1)
        }

        Column({
          space: 5
        }) {
          Row() {
            Text('潘神').fontSize(20).fontWeight(600).TestExtend(Color.Brown)
          }

          Row() {
            Text('阿达大大撒阿打算打撒发送方式阿达阿达电视撒大声地阿达大大')
          }

          Row() {
            Row() {
              Text('10-21 IP北京')
            }

            Row() {
              Image($r('app.media.ic_public_add_filled'))
                .width(20)
                .aspectRatio(1)
                .fillColor(this.isClick ? Color.Red : Color.Gray)
                .onClick(() => {
                  this.isClick = !this.isClick
                })
              Text('100')
            }
          }
          .justifyContent(FlexAlign.SpaceBetween).width('100%')
        }.alignItems(HorizontalAlign.Start).layoutWeight(1).margin(5)

      }

      Divider()

      Row(){
        Toggle({
          type: ToggleType.Switch,
          isOn: $$this.canUsed
        }).selectedColor(Color.Green)
      }

    }
  }
}


@Extend(Text)
function TestExtend(color: Color) {
  .fontColor(color)
}