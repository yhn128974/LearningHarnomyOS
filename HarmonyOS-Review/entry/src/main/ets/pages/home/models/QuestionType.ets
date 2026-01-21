import { JSON } from "@kit.ArkTS"

export interface QuestionType {
  id: string
  name: string
  icon: ResourceStr
  describeInfo: string,
  displayNewestFlag: 0 | 1,
  tags: Tag[]
}

export interface Tag {
  tagName: "Vue",
  nameColor: "#e7f4dc",
  borderColor: "#8ad94d"
}

export let mockQuestionTypeList: QuestionType[] = JSON.parse(JSON.stringify([
  {
    "id": 400,
    "name": "HarmonyOS高级认证题库",
    "icon": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/teach/operation/label/unittest/20250902/93647660422008832.png",
    "describeInfo": "HarmonyOS高级认证题库，不断地收集最新题目。",
    "displayNewestFlag": 1,
    "tags": [
      {
        "tagName": "HarmonyOS",
        "nameColor": "#edf2ff",
        "borderColor": "#3266ee"
      }
    ]
  },
  {
    "id": 396,
    "name": "后台管理系统",
    "icon": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/teach/%E5%9B%BE%E6%A0%87/%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86%E5%B0%81%E9%9D%A2.png",
    "describeInfo": "以vue技术栈为例的后台管理系统面试题整理",
    "displayNewestFlag": 0,
    "tags": [
      {
        "tagName": "微前端",
        "nameColor": "#e7f4dc",
        "borderColor": "#8ad94d"
      },
      {
        "tagName": "Vue",
        "nameColor": "#e7f4dc",
        "borderColor": "#8ad94d"
      }
    ]
  },
  {
    "id": 397,
    "name": "在线问医平台(医疗类)",
    "icon": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/teach/%E5%9B%BE%E6%A0%87/%E5%8C%BB%E7%96%97%E5%B0%81%E9%9D%A2.png",
    "describeInfo": "通过vue3+ts实现的在线医疗问诊相关技术整理",
    "displayNewestFlag": 0,
    "tags": [
      {
        "tagName": "TypeScript",
        "nameColor": "#edf2ff",
        "borderColor": "#3266ee"
      },
      {
        "tagName": "Vue3",
        "nameColor": "#e7f4dc",
        "borderColor": "#8ad94d"
      }
    ]
  }
]
)) as QuestionType[]