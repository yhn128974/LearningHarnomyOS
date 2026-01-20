export interface Data {
  title: string,
  address: string
}

@ObservedV2
export class listData implements Data {
  @Trace
  title: string
  @Trace
  address: string

  constructor(title: string,
    address: string) {
    this.title = title;
    this.address = address
  }
}

@Observed
export class listData2 implements Data {
  @Track
  title: string
  @Track
  address: string

  constructor(title: string,
    address: string) {
    this.title = title;
    this.address = address
  }
}

export let currentDate: listData[] =
  [new listData('异常时间', '北京'), new listData('异常时间', '南京'), new listData('异常时间', '上海')]