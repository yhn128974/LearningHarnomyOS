import { httpClient } from ".."
import { LoginParams, PageData, QuestionItem, QuestionItemParams, UserModel } from "../../../models"
import { QuestionDetail } from "../../../models/QuestionDetail"
import { QuestionType } from "../../../pages/home/models/QuestionType"

// tab导航列表
export const apiGetQuesTypeList = (): Promise<QuestionType[]> => {
  return httpClient.request<QuestionType[]>({
    method: 'get',
    url: 'question/type',
  })
}

// 问答列表
export const apiGetQuesList = (params: QuestionItemParams): Promise<PageData<QuestionItem>> => {
  return httpClient.request<PageData<QuestionItem>, QuestionItemParams>({
    method: 'get',
    url: 'question/list',
    params: params
  })
}

// 登录
export const apiLogin = (username: string, password: string): Promise<UserModel> => {
  return httpClient.request<UserModel, LoginParams>({
    method: 'post',
    url: 'login',
    data: {
      username,
      password
    }
  })
}

//获取试题详情,不能直接导出普通函数,要写成箭头函数的形式
export const apiGetQuesListDetail = (id: string): Promise<QuestionDetail> => {
  return httpClient.request<QuestionDetail>({
    method: 'get',
    url: `question/${id}`,
  })
}

export interface QuestionOptParams {
  id: string
  /* 0 试题  1 面经 */
  type: 0 | 1
  /* 1 点赞  2 收藏 */
  optType: 1 | 2
}

// 点赞收藏
export const apiQuestionOpt = (flag: 1 | 0, data: QuestionOptParams): Promise<null> => {
  return httpClient.request<null, QuestionOptParams>({
    url: flag === 1 ? 'question/opt' : 'question/unOpt',
    method: 'post',
    data
  })
}