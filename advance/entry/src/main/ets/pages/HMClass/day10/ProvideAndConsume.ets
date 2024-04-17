@Entry
@Component
struct GrandFather {
  @Provide grander_father_Age: number = 50;

  build() {

    Column() {
      Text(this.grander_father_Age.toString())
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('点击增加年龄').onClick((event: ClickEvent) => {
        this.grander_father_Age++
      })
      Father()
      Me()

    }

  }
}

@Component
struct Father {
  @Consume grander_father_Age: number;

  build() {
    Column() {
      Text(this.grander_father_Age.toString())
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('点击增加年龄').onClick((event: ClickEvent) => {
        this.grander_father_Age++
      })
    }
  }
}

@Component
struct Me {
  @Consume grander_father_Age: number;

  build() {
    Column() {
      Text(this.grander_father_Age.toString())
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('点击增加年龄').onClick((event: ClickEvent) => {
        this.grander_father_Age++
      })
    }
  }
}