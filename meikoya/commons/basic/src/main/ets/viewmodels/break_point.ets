export enum BreakPointEnum {
  XS = "xs",
  SM = "sm",
  MD = "md",
  LG = "lg"
}

// 封装一个工具 可以帮我们实现适配的更简单一点
interface BreakPointOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}

export class BreakPointType<T> {
  options: BreakPointOption<T> = {}

  constructor(opt: BreakPointOption<T>) {
    this.options = opt // 将传入的断点的值赋值给对象
  }

  getValue(breakPoint: BreakPointEnum): T {
    return (this.options as object)[breakPoint]
    // if (breakPoint === BreakPointEnum.XS) {
    //   return this.options.xs!
    // } else if (breakPoint === BreakPointEnum.SM) {
    //   return this.options.sm!
    // } else if (breakPoint === BreakPointEnum.MD) {
    //   return this.options.md!
    // } else {
    //   return this.options.lg!
    // }
  }
}