@Entry
@Component
struct ImageAnimatorCase {
  build() {
    Row() {
      Column() {

        ImageAnimator()
          .images(Array.from(Array(37), (item: string, index: number) => {
            // 图片路径不能含中文
            return { src: `/assets/materinal/JDLoading/Loading_${index + 1}.png` } as ImageFrameInfo
          }))
          .duration(3000)
          .state(AnimationStatus.Running)
          .fillMode(FillMode.None)
          .iterations(-1)// 必须有宽高
          .width(100)
          .aspectRatio(1)

        ImageAnimator()
          .images(Array.from(Array(36), (item: string, index: number) => {
            return { src: `/assets/materinal/weChatLive/live_icon_animated_${index}.png` } as ImageFrameInfo
          }))
          .duration(3000)
          .state(AnimationStatus.Running)
          .fillMode(FillMode.None)
          .iterations(-1)
          .width(100)
          .aspectRatio(1)
          .width('100%')
      }
      .height('100%')
    }
  }
}