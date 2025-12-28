import { promptAction } from '@kit.ArkUI';

//给对象定义类型的两种方式
interface User {
  name: string
  age: number
}

//观察该数据结构
@ObservedV2
class Person implements User {
  //规定被监听的数据，只有被监听的属性才能被实时渲染
  @Trace
  name: string;
  @Trace
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

@Entry
@ComponentV2
struct LocalPage {
  @Local money: number = 100;
  @Local title: string = 'longyou';
  @Local flag: boolean = false;
  //即使没有 Local被ObservedV2的对象内部状态的变化也能被监听到，但是外层对象的整体变化无法被监听了
  //也就是说Local只监听外部的简单数据变化， ObservedV2只负责监听类对象内部数据的修改
  user: Person = new Person('longyou', 20);

  build() {
    Column({
      space: 20
    }) {
      Text(this.money.toString())
      Text(this.title)
      Text(this.flag.toString())

      Text(this.user.name).fontSize(30)
      Text(this.user.age.toString()).fontSize(30)
      Button('click to add').onClick((event: ClickEvent) => {
        this.money++;
      })

      //更改对内部的值local无法实现双向数据绑定
      Button('change data in user').onClick(() => {
        this.user.name = 'ethan'
        this.user.age++;
        promptAction.openToast({
          message: `${this.user.name},${this.user.age}`

        })
      })

      //更改对象是可以监听到的
      Button('change all object').onClick((event: ClickEvent) => {
        this.user = new Person('ethan', 22)
      })
    }.width('100%').height('100%')

  }
}