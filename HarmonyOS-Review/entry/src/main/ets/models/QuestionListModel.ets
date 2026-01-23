import { httpClient } from "../commons/utils/http/httpClient";

export interface QuestionItem {
  id: number;

  /* 题干 */
  stem: string;

  /* 难度 */
  difficulty: number;

  /* 点赞数 */
  likeCount: number;

  /* 浏览数 */
  views: number;

  /* 是否已看 */
  readFlag: 0 | 1;
}

export interface QuestionItemParams {
  keyword?: string,
  type: number,
  questionBankType: 9 | 10
  sort?: SortType
  page: number
  pageSize: number,
}

export enum SortType {
  Default = 0,
  DifficultyLow = 10, //10从易到难
  DifficultyHigh = 11, //11从难道易
  ViewLow = 20, //20从低到高
  ViewHeight = 21, //21从高到底
  Commend = 30 //30推荐数据
}

//响应类型
export interface PageData<T> {
  total: number,
  pageTotal: number,
  rows: T[]
}

export async function getQuestList(typeID: number, page: number,
  sort: SortType, keyword?: string,): Promise<PageData<QuestionItem>> {
  let res = await httpClient.request<PageData<QuestionItem>, QuestionItemParams>({
    url: 'question/list',
    method: 'get',
    params: {
      keyword: keyword,
      type: typeID,
      questionBankType: 10,
      sort: sort || SortType.ViewLow,
      pageSize: 10,
      page: page,
    } as QuestionItemParams
  })

  return res
}



