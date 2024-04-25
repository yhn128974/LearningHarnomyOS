interface Image {
  url: ResourceStr,
  isselected: boolean,
}

@Observed
export class ImageModel implements Image {
  url: ResourceStr = ''
  isselected: boolean = false

  constructor(model: Image) {
    this.url = model.url
    this.isselected = model.isselected
  }
}


@Entry
@Component
struct Father {
  @State ImageModels: ImageModel[] = [
    new ImageModel({
      url: $r('app.media.1'),
      isselected: false
    }),
    new ImageModel({
      url: $r('app.media.2'),
      isselected: false
    }), new ImageModel({
    url: $r('app.media.3'),
    isselected: false
  }), new ImageModel({
    url: $r('app.media.4'),
    isselected: false
  }), new ImageModel({
    url: $r('app.media.5'),
    isselected: false
  }), new ImageModel({
    url: $r('app.media.6'),
    isselected: false
  }),

  ]

  getselectedNumber(): string {
    return this.ImageModels.filter(item => item.isselected).length.toString()
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.ImageModels, (item: ImageModel) => {
          GridItem() {
            Childern({
              ImageInfo: item
            })
          }
        })
      }.columnsTemplate('1fr 1fr').layoutWeight(1).columnsGap(5).rowsGap(5)

      Row() {
        Text(`当前全中的数量${this.getselectedNumber()}`)
      }.height(50)

      Row() {
        Button('点击还原').onClick((event: ClickEvent) => {
          for (const element of this.ImageModels) {
            element.isselected=false
          }
        })
      }.height(50)
    }
  }
}


@Component
struct Childern {
  @ObjectLink
  // @Prop
  ImageInfo: ImageModel

  build() {
    Column() {
      Image(this.ImageInfo.url).onClick(() => {
        this.ImageInfo.isselected = !this.ImageInfo.isselected
      }).height(200)
      Text(this.ImageInfo.isselected.toString())

    }

  }
}



