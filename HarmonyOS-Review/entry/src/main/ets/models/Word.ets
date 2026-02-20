export interface WordItem {
  zh: string
  en: string
  code: string
}

export type Words = Record<string, WordItem[]>