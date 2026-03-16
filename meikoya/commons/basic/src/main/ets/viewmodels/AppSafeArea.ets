// 存储当前全局安全区的对象
@ObservedV2
export class AppSafeArea {
  @Trace
  topHeight: number = 0
  @Trace
  bottomHeight: number = 0
}