export interface Peron {
  name: string,
  age: number
}

@ObservedV2
export class PersonModel implements Peron {
  @Trace
  name: string //需要响应

  age: number //不需要响应,如果没有加@Trace默认不会更新页面/不会自动持久化数据到本地=》如果需要则需要手动SAVE

  constructor(person: Peron) {
    this.name = person.name
    this.age = person.age
  }
}

