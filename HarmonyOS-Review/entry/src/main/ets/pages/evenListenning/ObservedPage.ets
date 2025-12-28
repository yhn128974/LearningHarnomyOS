@ObservedV2
class Hero {
  @Trace
  name: string;
  @Trace
  attack: number;

  constructor(name: string, attack: number) {
    this.name = name;
    this.attack = attack
  }
}

@Entry
@ComponentV2
struct ObservedPage {
  @Local heroList: Hero[] = [new Hero('longyou', 20), new Hero('ethan', 22), new Hero('zhangfei', 20)]

  build() {
    Column({
      space: 10
    }) {
      Text('hero List').fontSize(40)
      ForEach(this.heroList, (item: Hero) => {
        HeroItem({ item })
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct HeroItem {
  item: Hero = new Hero('', 0)

  build() {
    Column() {
      Text(`name: ${this.item.name}`)
      Text(`attack: ${this.item.attack}`)
      Button('improveAttack').onClick((event: ClickEvent) => {
        this.item.attack++
      })
    }.width('80%').height(150).border({
      width: 2
    })
  }
}