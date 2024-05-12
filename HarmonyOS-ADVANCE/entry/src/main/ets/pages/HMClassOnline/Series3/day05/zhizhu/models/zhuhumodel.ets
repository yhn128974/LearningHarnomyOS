export interface ZhiHu {
  image: ResourceStr,
  title: string,
  text: string,
  date: string,
  address: string,
  isClick: boolean,
  clickNumber: number;
}
@Observed
export class ZhiHuModel implements ZhiHu {
  image: ResourceStr = ''
  title: string = ''
  text: string = ''
  date: string = ''
  address: string = ''
  isClick: boolean = false
  clickNumber: number = 0

  constructor(model: ZhiHu) {
    this.image = model.image
    this.title = model.title
    this.text = model.text
    this.date = model.date
    this.address = model.address
    this.isClick = model.isClick
    this.clickNumber = model.clickNumber
  }
}
