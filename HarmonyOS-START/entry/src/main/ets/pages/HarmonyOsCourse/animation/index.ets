import lottie from '@ohos/lottie'


// 用animationItem实例接收
let animationItem = lottie.loadAnimation({
  container: this.renderingContext, // 渲染上下文
  renderer: 'canvas', // 渲染方式
  loop: true, // 是否循环播放,默认true
  autoplay: true, // 是否自动播放，默认true
  path: 'common/lottie/data.json', // json路径
})
lottie.loadAnimation({
  // 或者直接使用
  container: this.renderingContext, // 渲染上下文
  renderer: 'canvas', // 渲染方式
  loop: true, // 是否循环播放,默认true
  autoplay: true, // 是否自动播放，默认true
  path: 'common/lottie/data.json', // json路径
})


// // 订阅事件
// animationItem.addEventListener(event,function(){
//   // TODO something
// })
//
// // 取消订阅事件
// animationItem.removeEventListener(event,function(){
//   // TODO something
// })

// event事件类型
'enterFrame' // 每进入一帧就会触发
'loopComplete' // 当前循环下播放（循环播放/非循环播放）结束时触发
'complete' // 播放完成时触发
'segmentStart' // 播放指定片段时触发，playSegments、resetSegments等方法刚开始播放指定片段时会发出，如果playSegments播放多个片段，多个片段最开始都会触发。
'destroy' // 销毁动画时触发
'data_ready' // 数据准备完成
'DOMLoaded' // 动画相关dom已经被添加
'error' // 出现错误
'data_failed' // 数据加载失败

// // 播放、暂停、停止、销毁  可以使用lottie，也可以使用animationItem实例进行控制
// lottie.play();        // 从目前停止的帧开始播放
// lottie.stop();        // 停止播放，回到第0帧
// lottie.pause();       // 暂停该动画，在当前帧停止并保持
// lottie.togglePause(); // 切换暂停/播放状态
// lottie.destroy();     // 删除该动画，移除相应的元素标签等。在unmount的时候，需要调用该方法
//
// // 播放进度控制
// animationItem.goToAndStop(value, isFrame); // 跳到某个时刻/帧并停止。isFrame(默认false)指示value表示帧还是时间(毫秒)
// animationItem.goToAndPlay(value, isFrame); // 跳到某个时刻/帧并进行播放
// animationItem.goToAndStop(30, true);       // 例：跳转到第30帧并停止
// animationItem.goToAndPlay(300);            // 例：跳转到第300毫秒并播放
//
// // 控制帧播放
// animationItem.setSegment(5,15);             // 限定动画资源播放时的整体帧范围，即设置动画片段
// animationItem.resetSegments(5,15);          // 重置播放的动画片段
// animationItem.playSegments(arr, forceFlag); // arr可以包含两个数字或者两个数字组成的数组，forceFlag表示是否立即强制播放该片段
// animationItem.playSegments([10,20], false); // 例：播放完之前的片段，播放10-20帧
// animationItem.playSegments([[5,15],[20,30]], true); //例： 直接播放5-15帧和20-30帧

// // 动画基本属性控制
// lottie.setSpeed(speed);         // 设置播放速度，speed为1表示正常速度
// lottie.setDirection(direction); // 设置播放方向，1表示正向播放，-1表示反向播放

// 获取动画帧数属性
animationItem.getDuration();    //获取动画时长
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  // 初始化渲染上下文
  private renderingSettings: RenderingContextSettings = new RenderingContextSettings(true) // 设置开启抗锯齿
  private renderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings) // 创建2D渲染上下文

  // 加载Canvas画布

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Canvas(this.renderingContext)

      }
      .width('100%')
    }
    .height('100%')
  }
}



