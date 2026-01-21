export interface TabBarItem {
  icon: ResourceStr
  activeIcon: ResourceStr
  name: string
}

export const tabList: TabBarItem[] = [
  {
    icon: $r('app.media.tabbar_home'),
    activeIcon: $r('app.media.tabbar_home_fill'),
    name: "首页"
  },
  {
    icon: $r('app.media.tabbar_project'),
    activeIcon: $r('app.media.tabbar_project_fill'),
    name: "项目"
  },
  {
    icon: $r('app.media.tabbar_interview'),
    activeIcon: $r('app.media.tabbar_interview_fill'),
    name: "面经"
  },
  {
    icon: $r('app.media.tabbar_mine'),
    activeIcon: $r('app.media.tabbar_mine_fill'),
    name: "我的"
  },
]