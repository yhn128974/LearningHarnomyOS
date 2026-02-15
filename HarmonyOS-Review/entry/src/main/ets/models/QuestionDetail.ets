import { QuestionItem } from ".";

export interface QuestionDetail extends QuestionItem {
  /* 答案 */
  answer: string
  /* 是否收藏 */
  collectFlag: 0 | 1
  /* 是否点赞 */
  likeFlag: 0 | 1
  /* 所属模块 */
  stage: string[]
}

export interface TimeItem {
  questionId: string
  startTime: number
  endTime: number
}