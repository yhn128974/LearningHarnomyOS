class Person {
  name: string
  age: number
  gf?: Person

  constructor(name: string, age: number, gf?: Person) {
    this.name = name;
    this.age = age;
    this.gf = gf
  }
}


@Entry
@Component
struct Index {
  // 必须初始化
  // 支持 class Object string number boolean enum 等类型以及对应的数组
  // 嵌套类型以及数组中的对象属性无法触发视图的更新
  @State message: string = 'Hello World';
  // @State p: Person = new Person('jack', 20, new Person('Rose', 23))
  @State persons: Person[] = [new Person('jack', 20), new Person('Rose', 23)]

  build() {
    Row() {
      Column() {
        ForEach(this.persons, (item: Person, index: number) => {
          Text(`${item.name}:${item.age}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .border({
              width: 1,
              style: BorderStyle.Solid
            })
          Button('点击加人').onClick((event: ClickEvent) => {
            // this.message = 'HI LONGYOU '
            this.persons.push(new Person(`"研究${index}`, 20))
          })
          Button('点击删除').onClick((event: ClickEvent) => {
            // this.message = 'HI LONGYOU '
            this.persons.splice(index, 1)

          })


        })


        // Text(`${this.p.gf.name}:${this.p.gf.age}`)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        //   .border({
        //     width: 1,
        //     style: BorderStyle.Solid
        //   })
        // Button('点击更新').onClick((event: ClickEvent) => {
        //   // this.message = 'HI LONGYOU '
        //   this.p.gf.age++;
        // })
      }
      .width('100%')
    }
    .height('100%')
  }
}

