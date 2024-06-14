//以下示例展示组件更新和@Track的处理步骤。对象log是@State装饰的状态变量，
// logInfo是@Track的成员属性，其余成员属性都是非@Track装饰的，而且也不准备在UI中更新它们的值。


//不能在UI中使用非@Track装饰的属性，包括不能绑定在组件上、不能用于初始化子组件，错误的使用将导致JSCrash；
// 可以在非UI中使用非@Track装饰的属性，如事件回调函数中、生命周期函数中等。
//
// 建议开发者不要混用包含@Track的class对象和不包含@Track的class对象，如联合类型中、类继承中等。
class Log {
  @Track logInfo: string;
  owner: string;
  id: number;
  time: Date;
  location: string;
  reason: string;

  constructor(logInfo: string) {
    this.logInfo = logInfo;
    this.owner = 'OH';
    this.id = 0;
    this.time = new Date();
    this.location = 'CN';
    this.reason = 'NULL';
  }
}

@Entry
@Component
struct AddLog {
  @State log: Log = new Log('origin info.');

  build() {
    Row() {
      Column() {
        Text(this.log.location)
        Text(this.log.logInfo)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // The properties without @Track can be used in the event handler.
            console.log('owner: ' + this.log.owner +
              ' id: ' + this.log.id +
              ' time: ' + this.log.time +
              ' location: ' + this.log.location +
              ' reason: ' + this.log.reason);
            this.log.time = new Date();
            this.log.id++;
            this.log.logInfo += ' info.';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}