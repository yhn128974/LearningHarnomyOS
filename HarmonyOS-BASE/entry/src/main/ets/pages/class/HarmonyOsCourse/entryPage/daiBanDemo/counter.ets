import { Item } from './item';
import { Title } from './title';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State missions: Array<string> = ['做作业', '打游戏', '喝水']
  @State counter: number = 0;
  @State allFished: boolean = false;
  @Provide @Watch('pushMission') isfished: boolean = false;

  pushMission(): void {

    console.log('push')
    // this.counter++;
    // if (this.counter == this.missions.length){
    //   this.allFished=true
    // }

  }

  build() {
    Row() {
      Column() {
        Title({ allFished: $allFished })
        ForEach(this.missions, (mission: string, index: number) => {
          Column() {
            Item({ mession: mission, allFished: this.allFished, isfished: this.isfished })
          }
        })
        if (!this.allFished) {
          Text('请继续完成任务')
        } else {
          Text('恭喜任务全部完成了')
        }
      }
      .height('100%')
    }
  }
}
