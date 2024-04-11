interface Person {
  name: string,
  age: number
}

@Builder
// 函数的形式参数为对象
function PersonBar(person: Person) {
  Row() {
    Text(person.name)
    Text(person.age.toString())
  }
  .padding(20)
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)

}

@Entry
@Component
struct Index {
  @State Alice: Person = {
    name: 'Alice',
    age: 20
  }

  build() {

    Column({
      space: 10
    }) {
      Text(this.Alice.age.toString()).width('100%').padding(20)
      // 传值不具备响应式
      // 按照引用{property:value...}可以实现数据更新
      // 调用时传入一个对象
      PersonBar({
        name: this.Alice.name,
        age: this.Alice.age
      })
      Button('点击更新Alice年龄')
        .onClick((event: ClickEvent) => {
          this.Alice.age++
        })
    }
    .width('100%')

  }
}

