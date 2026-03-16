import { CategoryItem, HDMGoodsItem, RequestRcp } from 'basic'
import { Banner, HotResult } from '../viewmodels'

// 获取轮播图
// 封装六个接口

// 推荐列表的请求的参数的类型
export interface RecommendParams {
  limit: number
}

// 获取推荐数据
export const getRecommendAPI = (params: RecommendParams) => {
  return RequestRcp.get<HDMGoodsItem[]>("/home/recommend", params)
}

export const getBannerAPI = () => {
  return RequestRcp.get<Banner[]>("/home/banner")
}

export const getCategoryAPI = () => {
  return RequestRcp.get<CategoryItem[]>("/home/category/head")
}

// 获取特惠推荐
export const getHotResultAPI = () => {
  return RequestRcp.get<HotResult>("/hot/preference")
}

// 爆款推荐
export const getInVogueAPI = () => {
  return RequestRcp.get<HotResult>("/hot/inVogue")
}

// 一站买全
export const getOneStopAPI = () => {
  return RequestRcp.get<HotResult>("/hot/oneStop")
}

// 获取新鲜好物
export const getHomeNewAPI = () => {
  return RequestRcp.get<HDMGoodsItem[]>("/home/new")
}

