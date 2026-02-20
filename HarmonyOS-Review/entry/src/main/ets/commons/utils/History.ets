import { preferences } from '@kit.ArkData'
import { AppStorageV2 } from '@kit.ArkUI'
import { currentUIAbilityContext } from '../../models'


class History {
  store: preferences.Preferences | null = null

  getStore() {
    if (!this.store) {
      const context = AppStorageV2.connect(currentUIAbilityContext)!.context
      this.store = preferences.getPreferencesSync(
        context,
        { name: 'history-store' }
      )
    }
    return this.store
  }

  async setItem(keyword: string) {
    this.getStore().putSync(keyword, keyword)
    await this.getStore().flush()
  }

  async delItem(keyword: string) {
    this.getStore().deleteSync(keyword)
    this.getStore().flush()
  }

  async clear() {
    this.getStore().clearSync()
    await this.getStore().flush()
  }

  getAll() {
    const obj = this.getStore().getAllSync()
    return Object.keys(obj)
  }
}

export const history = new History()