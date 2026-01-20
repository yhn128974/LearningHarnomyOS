import { promptAction } from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

interface Person {
  name: string;
  age: number
}

@ObservedV2
class PersonModel implements Person {
  @Trace
  name: string
  @Trace
  age: number

  constructor(peron: Person) {
    this.name = peron.name
    this.age = peron.age
  }
}


@Entry
@ComponentV2
struct MonitorPage {
  @Local message: string = 'Hello World';
  @Local age: number = 15
  @Local Alice: PersonModel = new PersonModel({
    name: 'Alice',
    age: 20
  })

  @Monitor('age', 'message')
  onAgeChange(monitor: IMonitor) {

    //monitor.dirty被监听的属性数组
    console.log(`${monitor.dirty}`)
    //monitor.value 获取被监听的值
    // console.log(`${monitor.value('age')?.before}`)
    // console.log(`${monitor.value('age')?.now}`)
  }

  @Monitor('Alice.name', 'Alice.age')
  onPersonChange(monitor: IMonitor) {

    promptAction.openToast({
      message: `you new name is ${this.Alice.name},and you age is ${this.Alice.age}`
    })
  }

  build() {
    Column() {
      Text(this.message)
      Text(`${this.age}`)
      Button('change her age and message').onClick((event: ClickEvent) => {
        this.age++;
        this.message = 'hello typescript'
      })
      Divider().height(10)
      Text(this.Alice.name)
      Text(this.Alice.age.toString());
      Button('change Alice info').onClick(() => {
        this.Alice.age++;
        this.Alice.name = 'Peter'
      })
    }

    .height('100%')
    .width('100%')
  }
}