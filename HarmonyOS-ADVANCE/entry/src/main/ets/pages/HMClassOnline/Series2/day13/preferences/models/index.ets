



export interface ArrayNumber{
  a:string,
  b:string,
  c:string
}
export class ArrayNumberModel implements ArrayNumber {
  a: string = ''
  b: string = ''
  c: string = ''

  constructor(model: ArrayNumber) {
    this.a = model.a
    this.b = model.b
    this.c = model.c
  }
}
