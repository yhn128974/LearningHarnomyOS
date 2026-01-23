export interface QuestionType {
  id: number
  name: string
  displayNewestFlag: 0 | 1
}
export  interface AxiosRes {
  message: string
  code: number
  data: QuestionType[]
}

export const mockData: QuestionType[] = [
  { id: 1, name: 'ArkTS', displayNewestFlag: 0 },
  { id: 2, name: 'ArkUI', displayNewestFlag: 1 },
  { id: 3, name: 'Hap', displayNewestFlag: 1 },
  { id: 4, name: 'Hsp', displayNewestFlag: 0 },
  { id: 5, name: 'Har', displayNewestFlag: 0 },
  { id: 6, name: 'Ability', displayNewestFlag: 0 },
  { id: 7, name: 'Stage', displayNewestFlag: 0 },
  { id: 8, name: 'Kit', displayNewestFlag: 0 }
]

