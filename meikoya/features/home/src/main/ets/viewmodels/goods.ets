import { HDMGoodsItem, HDMSkuType, HDMSpec } from "basic";

// 其他略
export interface GoodsProperty {
  name: string;
  value: string;
}

export interface GoodsDetail {
  pictures: string[];
  properties: GoodsProperty[];
}

export interface Goods extends HDMGoodsItem {
  inventory: number
  mainPictures: string[]
  details: GoodsDetail
  specs: HDMSpec[]
  skus: HDMSkuType[]
}

export interface HmSpecValue {
  name: string
  picture: string | null
  selected: boolean | null
  disabled: boolean | null
}