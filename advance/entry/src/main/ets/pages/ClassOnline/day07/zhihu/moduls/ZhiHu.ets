export  interface zhifu {
  ImageUrl: ResourceStr,
  name: string,
  text: string,
  address: string,
  dainzhanshu: number,
  likeFlage?:boolean, //
}

export class zhifuModel implements zhifu {
  ImageUrl: ResourceStr = ''
  name: string = ''
  text: string = ''
  address: string = ''
  dainzhanshu: number = 0
  likeFlage=false

  constructor(model: zhifu) {
    this.ImageUrl = model.ImageUrl
    this.name = model.name
    this.text = model.text
    this.address = model.address
    this.dainzhanshu = model.dainzhanshu
    this.likeFlage=model.likeFlage?model.likeFlage:false
  }
}
