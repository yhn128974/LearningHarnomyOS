import { promptAction } from '@kit.ArkUI';

class TestObj {
  a: number = 0
  b: string = "123"
  c: boolean = false
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World1';
  @State name:string = "Index name"
  // 通过索引取字段的存在形式
  test(obj: object) {
    console.log(Object.keys(obj).map(item => `${item}=${obj[item]}`).toString())
  }

  // aboutToAppear(): void {
  //   let o = new TestObj()
  //   this.test(o)
  // }

  test2() {
    console.log('拿到的this',this)
    // promptAction.showToast({ message: "Hello World1" })
  }

  test3(){
    let name:string = "test3 name"
    console.log(""+this.name)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('test').onClick((event: ClickEvent) => {
          this.test2()
          this.test3()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}


// //数组的展开运算符,(浅拷贝)
// let arr = [11, 2, 3, 4, 5]
// let arr2 = [...arr, 999]
// console.log("" + arr2);