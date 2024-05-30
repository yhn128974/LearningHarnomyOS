interface information {
  iconurl: string,
  text: string
}

@Entry
@Component
struct Index {
  @State titleInformations: information[] = [
    {
      iconurl: 'app.media.ic_01',
      text: '内容精选'
    }, {
    iconurl: 'app.media.ic_02',
    text: '学堂'
  },
    {
      iconurl: 'app.media.ic_03',
      text: '鸿蒙社区'
    },
    {
      iconurl: 'app.media.ic_04',
      text: '博客'
    },
    {
      iconurl: 'app.media.ic_05',
      text: '企业培训'
    },
    {
      iconurl: 'app.media.ic_06',
      text: '群众'
    },
    {
      iconurl: 'app.media.ic_07',
      text: '讲师'
    },
  ]

  build() {
    Column() {
      List() {
        ForEach(this.titleInformations, (item: information, index) => {
          ListItem() {
            Column() {
              Image($r(item.iconurl)).width(40).margin({
                bottom: 5,
                left: 15,
                right: 15
              })
              Text(item.text).lineHeight(14).fontSize(14)
            }.width('20%')
          }
        })

      }.listDirection(Axis.Horizontal).margin(15).scrollBar(BarState.Off)
    }.border({
      color: {
        bottom: '#eee'
      },
      width: {
        bottom: 2
      },
      style: {
        bottom: BorderStyle.Solid
      }
    }).height(100)

  }
}

