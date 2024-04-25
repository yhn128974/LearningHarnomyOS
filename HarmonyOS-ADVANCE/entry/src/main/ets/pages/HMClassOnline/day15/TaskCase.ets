import { taskpool } from '@kit.ArkTS';

@Entry
@Component
struct TaskCase {
  @State message: string = 'Hello World';

  beginTaskPool() {
    // 开启一个任务池线程，执行的方法必须是全局方法
    taskpool.execute(tak1)
    taskpool.execute(tak2)

  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('执行多线程操作').onClick((event: ClickEvent) => {
          this.beginTaskPool()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 声明改函数为多线程函数
@Concurrent
function tak1() {

  for (let i = 0; i < 100; i++) {
    console.log(`任务1 ${i}`)
  }
}

// 声明改函数为多线程函数
@Concurrent
function tak2() {

  for (let i = 0; i < 100; i++) {
    console.log(`任务2 ${i}`)
  }
}