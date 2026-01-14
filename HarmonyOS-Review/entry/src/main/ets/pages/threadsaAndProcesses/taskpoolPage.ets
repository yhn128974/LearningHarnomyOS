import { taskpool } from '@kit.ArkTS'
import { emitter } from '@kit.BasicServicesKit'

//Concurrent taskpool任务函数
@Concurrent
async function getData(param: string) {
  return await new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve(param + Date.now().toString())
      reject('false')

      emitter.emit('emit.emit')
    }, 300)

  })
}

@Entry
@ComponentV2
struct TaskpoolPage {
  @Local message: string = 'Hello World';
  @Local
  taskGroup: string[] = []
  @Local
  taskGroupPriority: string[] = []
  @Local taskNumber: number = 0
  taskArray: taskpool.Task[] = []

  aboutToAppear(): void {
    emitter.on('emit.emit', () => {
      this.taskNumber++
    })
  }

  async addTask() {
    //给taskpool添加方法:taskpool.execute，不可以分配优先度
    await taskpool.execute(getData, 'addTask').then((res) => {
      this.message = res.toString()
    })
  }

  async createTask() {
    //使用创建taskpool的方法给taskpool分配函数,可分配优先度
    const currentTaskPool = new taskpool.Task(getData, 'createTask')
    await taskpool.execute(currentTaskPool, taskpool.Priority.LOW).then((res) => {
      this.message = res.toString()
    })
  }

  async createTaskGroup() {
    //使用创建taskpool组的方法给taskpool分配函数，不可以分配优先度
    const taskGroup = new taskpool.TaskGroup()
    taskGroup.addTask(getData, 'groupTask1')
    taskGroup.addTask(getData, 'groupTask2')
    taskGroup.addTask(getData, 'groupTask3')
    taskGroup.addTask(getData, 'groupTask4')

    //将组加入taskpool
    await taskpool.execute(taskGroup).then((res) => {
      this.taskGroup = res as string[]
    })
  }

  async multiTaskPriority() {
    let taskArray: taskpool.Task[] = []
    for (let index = 0; index < 100; index++) {
      let currentTaskPool = new taskpool.Task(getData, 'createTask' + index + ':')
      taskArray.push(currentTaskPool)
    }
    this.taskArray = taskArray;

    for (let index = 0; index < taskArray.length; index += 4) {
      taskpool.execute(taskArray[index], taskpool.Priority.HIGH).then((res) => {
        this.taskGroupPriority.push(res.toString())
      })
      taskpool.execute(taskArray[index+1], taskpool.Priority.MEDIUM).then((res) => {
        this.taskGroupPriority.push(res.toString())
      })
      taskpool.execute(taskArray[index+2], taskpool.Priority.LOW).then((res) => {
        this.taskGroupPriority.push(res.toString())
      })
      taskpool.execute(taskArray[index+3], taskpool.Priority.IDLE).then((res) => {
        this.taskGroupPriority.push(res.toString())
      })
    }
  }

  build() {
    Column({
      space: 10
    }) {

      Text(this.taskNumber.toString()).fontColor(Color.Red)
      Text(this.message)
      Button('add function to taskpool')
        .onClick(() => {
          this.addTask()
        })
      Button('create taskpool and change message').onClick(() => {
        this.createTask()
      })

      Divider().height(5)
      Button('create taskpoolGroup and change messageGroup').onClick(() => {
        this.createTaskGroup()
      })
      ForEach(this.taskGroup, (item: string) => {
        Text(item)
      })


      Divider().height(5)
      Button('get message form  taskGroupPriority ').onClick(() => {
        this.multiTaskPriority()
      })

      Button('cancel task Array').onClick(() => {
        //取消线程队列中的任务 taskpool.cancel()
        taskpool.cancel(this.taskArray[20])
      })

      List() {
        ForEach(this.taskGroupPriority, (item: string) => {
          ListItem() {
            Text(item)
          }
        })
      }.layoutWeight(1)

    }
    .height('100%')
    .width('100%')
  }
}