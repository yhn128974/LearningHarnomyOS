import { router } from '@kit.ArkUI'


interface routerINTERFACE {
  url: string,
  title: string,
}

@Entry
@Component
struct Index {
  @State routers: routerINTERFACE[] = [{
    url: 'pages/HarmonyOsCourse/simple_page_component/animation/animation"',
    title: '动画',
  },
  ]

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.routers, (item: routerINTERFACE, index) => {
            ListItem(){
              Row() {
                Text(item.url)

              }.width('100%').onClick(() => {
                router.pushUrl({
                  url: item.title
                })
              })
            }

          })
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}

