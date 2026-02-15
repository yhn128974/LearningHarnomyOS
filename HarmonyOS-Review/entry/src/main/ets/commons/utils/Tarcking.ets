import { httpClient, logger } from '.'
import { TimeItem } from '../../models/QuestionDetail'
import { JSON } from '@kit.ArkTS'
import { preferences } from '@kit.ArkData'
import { AppStorageV2 } from '@kit.ArkUI'
import { currentUIAbilityContext } from '../../models'

class Tracking {
  store: preferences.Preferences | null = null
  dataKey: string = 'time-list'

  getStore() {
    if (!this.store) {
      const context = AppStorageV2.connect(currentUIAbilityContext)!.context
      this.store = preferences.getPreferencesSync(context, {
        name: 'tracking-store'
      })
    }
    return this.store
  }

  async record(startTime: number, endTime: number, questionId: string) {
    const json = this.getStore().getSync(this.dataKey, '[]')
    const list = JSON.parse(json as string) as TimeItem[]
    list.push({ startTime, endTime, questionId })
    this.getStore().putSync(this.dataKey, JSON.stringify(list))
    await this.getStore().flush()
  }

  async report(force: boolean = false) {
    const json = this.getStore().getSync(this.dataKey, '[]')
    const list = JSON.parse(json as string) as TimeItem[]
    //
    console.log('tracking-list', JSON.stringify(list))
    //
    if (list.length >= 5 || (force && list.length)) {
      await httpClient.request<null>({
        method: 'post',
        url: 'time/tracking',
        data: { timeList: list }
      })
      this.getStore().deleteSync(this.dataKey)
      await this.getStore().flush()
    }


  }
}

export const tracking = new Tracking()