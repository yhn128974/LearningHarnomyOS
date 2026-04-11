import { RequestRcp } from '../utils'
import { GoodsItems } from '../viewmodels'


// 获取猜你喜欢的API
export const getGuessDataAPI = (params: object) => {
  return RequestRcp.get<GoodsItems>("/home/goods/guessLike", params)
}
