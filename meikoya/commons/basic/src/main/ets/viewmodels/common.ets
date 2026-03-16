import { BreakPointEnum } from "./break_point";
import { CategoryItem } from "./business";

//断点工具类
@ObservedV2
export class AppBreakPoint {
  @Trace
  breakPoint: BreakPointEnum = BreakPointEnum.XS
}

export interface ResponseData<T> {
  code: string
  message: string
  result: T
}


@ObservedV2
export class AppCategory {
  @Trace
  category: CategoryItem[] = []
}