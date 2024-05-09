@Observed
class Task {
  static id: number = 0;
  name: string = `任务${Task.id++}`;
  fished: boolean = false;
}

// 卡片样式
@Styles
function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({
    radius: 6,
    color: "#1f0000",
    offsetX: 2,
    offsetY: 4
  })
}

// 完成任务后的样式
@Extend(Text)
function fished() {
  .decoration({
    type: TextDecorationType.LineThrough
  })
  .fontColor('#B1b2b1')
}

class StateInfo {
  totalTask: number = 0;
  fishTask: number = 0;
}

@Entry
@Component
struct Index {
  @Provide stat: StateInfo = new StateInfo()

  build() {
    Column({
      space: 10
    }) {
      // 任務統計
      TaskStatistics()
      // 主頁
      TaskListItem()
    }
    .width('100%').height('100%').backgroundColor('#f1f2f3')
  }
}

@Component
struct TaskStatistics {
  @Consume stat: StateInfo

  build() {
    Row() {
      Text('任务进度').fontSize(30).fontWeight(FontWeight.Bold)
      Stack() {
        Progress({
          value: this.stat.fishTask,
          total: this.stat.totalTask,
          type: ProgressType.Ring
        })
        Row() {
          Text(this.stat.fishTask.toString()).fontSize(24).fontColor('#36D')
          Text(`/${this.stat.totalTask.toString()}`).fontSize(24)
        }
      }
    }.justifyContent(FlexAlign.SpaceEvenly).margin({
      top: 20,
      bottom: 10
    }).card()
  }
}


@Component
struct TaskListItem {
  @Consume stat: StateInfo;
  @State tasks: Task[] = []

  // 數據更新處理函數
  handleTaskChange() {
    this.stat.totalTask = this.tasks.length
    this.stat.fishTask = this.tasks.filter(task => task.fished).length
  }

  @Builder
  DeleteButton(index: number) {
    Button() {
      // button 可以是一個容器
      Image($r('app.media.task_delete')).fillColor(Color.White)
    }
    .onClick((event: ClickEvent) => {
      this.tasks.splice(index, 1)
      this.handleTaskChange()
    })
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin({
      left: 10,
      top: 5,
      bottom: 5
    })
  }

  build() {
    Column() {
      //   按钮
      Row() {
        Button('添加任务').onClick((event: ClickEvent) => {
          this.tasks.push(new Task())
          this.stat.totalTask = this.tasks.length
        }).layoutWeight(1).margin(10)
      }

      // 任务列表
      List({ space: 10 }) {
        ForEach(this.tasks, (task: Task, index: number) => {
          ListItem() {
            // 卡片展示
            Card_Item({ task: task, onTaskChange: this.handleTaskChange.bind(this) })
          }.swipeAction({
            end: this.DeleteButton(index)
          })
        })
      }
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
  }
}


@Component
struct Card_Item {

 @Prop onTaskChange:()=> void

  @ObjectLink task: Task


  build() {
    // 卡片展示
    Row() {
      if (this.task.fished) {
        Text(this.task.name).fished()
      } else {
        Text(this.task.name).fontSize(20)
      }
      Checkbox()
        .select(this.task.fished)
        .onChange(value => {
          // 修改任务状态
          this.task.fished = value
          // 更新统计状态
          this.onTaskChange()
        })
    }.card().justifyContent(FlexAlign.SpaceBetween)
  }
}




