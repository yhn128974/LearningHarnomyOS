@Entry
@ComponentV2
struct LocalParamEvent {
  @Local message: string = 'Hello World';
  @Local money: number = 999

  costMoney() {
    this.money -= 100;
  }

  build() {
    Column() {
      Column() {
        Text('Im father')
        Text(this.money.toString())
        Button('add my money 100').onClick(() => {
          this.money += 100
        })

      }

      Child1({
        money: this.money,
        costMoney: () => {
          this.costMoney()
        }

      })

      Child2({
        money: this.money,

      })

    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct Child1 {
  @Param money: number = 0
  @Event costMoney: () => void = () => {
  }

  build() {
    Column() {
      Text('child1')
      Text(this.money.toString())
      Button('cost 100 money from my father').onClick(() => {
        this.costMoney()
      })
    }.width('100%')
  }
}

22

@ComponentV2
struct Child2 {
  @Require @Param money: number

  build() {
    Column() {
      Text('child1')
      Text(this.money.toString())
    }.width('100%')
  }
}