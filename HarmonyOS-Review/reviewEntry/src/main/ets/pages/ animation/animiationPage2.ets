import { Animator, AnimatorResult } from '@kit.ArkUI';

@Entry
@ComponentV2
struct AnimiationPage2 {
  @Local message: string = 'Hello World';
  @Local angle: number = 0
  @Local isPlay: boolean = false
  animationConter: AnimatorResult = Animator.create({
    begin: 0,
    end: 360,
    duration: 1000,
    easing: "linear",
    delay: 0,
    fill: "forwards",
    direction: "normal",
    iterations: -1,
  })

  aboutToAppear(): void {
    //对动画的数据进行实时监听赋值
    this.animationConter.onFrame = (progress) => {
      this.angle = progress
    }
  }

  build() {
    RelativeContainer() {
      Column() {

        Image($r('app.media.img'))
          .width(100)
          .aspectRatio(1)
          .border({
            width: 1
          })
          .rotate({
            angle: this.angle
          })
          .borderRadius(50)


        Button('is playing ').onClick(() => {
          // animateTo({
          //   duration: 1000,
          //   iterations: -1
          // }, () => {
          //   this.angle = 360
          // })

          this.isPlay = !this.isPlay
          this.isPlay ? this.animationConter.play() : this.animationConter.pause()
        })
      }.height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}