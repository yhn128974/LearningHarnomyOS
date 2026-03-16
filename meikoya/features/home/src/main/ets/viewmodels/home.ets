import { HDMGoodsItem } from "basic";

export interface Banner {
  id: string;
  imgUrl: string;
  type: string;
}


export interface Params {
  title: string,
  subTitle: string,
  bg: ResourceStr,
  list: HDMGoodsItem[]
}

export enum DiscountType {
  COMMAND,
  DISCOUNT,
  NEW
}

// 特惠推荐的接口
export interface HotResult {
  id: string;
  subTypes: SubType[];
  title: string;
}

export interface SubType {
  goodsItems: GoodsItems;
  id: string;
  title: string;
}

export interface GoodsItems {
  counts: number;
  items: HDMGoodsItem[];
  page: number;
  pages: number;
  pageSize: number;
}