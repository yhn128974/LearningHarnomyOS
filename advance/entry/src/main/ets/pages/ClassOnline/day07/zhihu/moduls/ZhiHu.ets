interface zhifu {
  ImageUrl: string,
  name: string,
  text: string,
  address: string,
  dainzhanshu: number,
}

export class zhifuModel implements zhifu {
  ImageUrl: string = ''
  name: string = ''
  text: string = ''
  address: string = ''
  dainzhanshu: number = 0

  constructor(model: zhifu) {
    this.ImageUrl = model.ImageUrl
    this.name = model.name
    this.text = model.text
    this.address = model.address
    this.dainzhanshu = model.dainzhanshu
  }
}
