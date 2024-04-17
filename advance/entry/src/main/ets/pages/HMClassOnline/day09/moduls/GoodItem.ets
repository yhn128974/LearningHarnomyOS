export interface GoodItem {
  goods_name: string
  goods_price: number
  goods_img: ResourceStr
  good_count: number
  id: number
}

export interface WorkRecord {
  companyName: string,
  workDate: string,
  workSalary: number
  workContent: string,
  workTitle: string
}