export interface WorkExpression {
  companyName: string;
  workDate: Date;
  workSalary: string
  workContent: string;
  workTtitle: string;
}

interface GoodItem {
  goods_name: string
  goods_price: number
  goods_img: string | ResourceStr
  goods_count: number
  id: number
}

export class WorkExpressionModel implements WorkExpression {
  companyName: string = ''
  workDate: Date = new Date()
  workSalary: string = ''
  workContent: string = ''
  workTtitle: string = ''

  constructor(model: WorkExpression) {
    this.companyName = model.companyName
    this.workDate = model.workDate
    this.workSalary = model.workSalary
    this.workContent = model.workContent
    this.workTtitle = model.workTtitle
  }
}

export class GoodItemModel implements GoodItem {
  goods_name: string = ''
  goods_price: number = 0
  goods_img: string | ResourceStr = ''
  goods_count: number = 0
  id: number = 0

  constructor(model: GoodItem) {
    this.goods_name = model.goods_name
    this.goods_price = model.goods_price
    this.goods_img = model.goods_img
    this.goods_count = model.goods_count
    this.id = model.id
  }
}
