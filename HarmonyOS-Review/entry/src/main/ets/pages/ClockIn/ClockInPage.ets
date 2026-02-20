import { HcNavBar } from "../../commons/components"
import { HmCalendar, HmCalendarSelectedDay, HmCalendarType } from '@ohmos/calendar'
import { ClockInfo, ClockInfoParams } from "../../models"
import { httpClient } from "../../commons/utils"

interface DayBuilderParams {
  day: number
  text: string
}


@Component
struct ClockInPage {
  @State clockInfo: ClockInfo = {
    flag: false,
    clockinNumbers: 0,
    totalClockinNumber: 0,
    clockins: []
  }
  @State selectedDays: HmCalendarSelectedDay[] = []

  aboutToAppear(): void {
    const current = new Date()
    this.getClockInfo({ year: current.getFullYear().toString(), month: (current.getMonth() + 1).toString() })
  }

  async getClockInfo(params: ClockInfoParams) {
    const res = await httpClient.request<ClockInfo>({ url: 'clockinInfo', params })
    this.clockInfo = res
    this.selectedDays = res.clockins.map(item => ({ date: item.createdAt } as HmCalendarSelectedDay))
  }

  @Builder
  dayBuilder(params: DayBuilderParams) {
    Column() {
      Row() {
        Text(params.day.toString())
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Text('天')
          .fontSize(10)
          .fontColor($r('app.color.common_gray_01'))
          .margin({ bottom: 8, left: 10 })
      }
      .alignItems(VerticalAlign.Bottom)

      Text(params.text)
        .fontSize(10)
        .fontColor($r('app.color.common_gray_01'))
    }.margin({ right: 36 })
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column({ space: 16 }) {
        HcNavBar({ title: '每日打卡', showRightIcon: false })
        Row() {
          this.dayBuilder({ day: 100, text: '累计打卡' })
          this.dayBuilder({ day: 10, text: '连续打卡' })
        }
        .padding({
          top: 10,
          bottom: 25,
          left: 16,
          right: 16
        })
        .width('100%')
        .justifyContent(FlexAlign.Start)

        Row() {
          HmCalendar({
            color: $r('app.color.common_main_color'),
            // type:HmCalendarType.MONTH_DOT,
            selectedDays: this.selectedDays,
            onClickDate: (day) => {
              //

            },
            onChangeMonth: (date) => {
              const arr = date.split('-')
              this.getClockInfo({
                year: arr[0],
                month: arr[1]
              })
            }
          })
            .borderRadius(8)
            .border({ width: 0.5, color: '#ededed' })
            .shadow({ color: '#ededed', radius: 16 })
            .backgroundColor($r('app.color.white'))
        }
        .padding({ left: 16, right: 16 })
      }
      .width('100%')
      .height('100%')
      .backgroundImage($r('app.media.clocked_bg'))
      .backgroundImageSize({ width: '100%' })
    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function ClockInPageBuilder() {
  ClockInPage()
}