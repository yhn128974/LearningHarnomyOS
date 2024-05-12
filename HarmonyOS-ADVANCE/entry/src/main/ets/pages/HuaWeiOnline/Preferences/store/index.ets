import dataPreferences from '@ohos.data.preferences';
import { Person, PersonModel } from '../models'
import { promptAction } from '@kit.ArkUI';

export class PersonStore {
  static context: Context

  static getStore() {
    return dataPreferences.getPreferencesSync(PersonStore.context || getContext(), { name: 'PersonStore' });
  }

  static async deleteStore() {
    dataPreferences.deletePreferences(PersonStore.context || getContext(), { name: 'PersonStore' })
  }

  static async clearStore() {
    let thisStore = await PersonStore.getStore()
    thisStore.clear(() => {
      promptAction.showToast({
        message: '清除全部数据'
      })
    })
    thisStore.flush()
  }

  static async setStoreItem(id: string, newPerson: PersonModel) {
    let thisStore = await PersonStore.getStore()
    thisStore.putSync(id, JSON.stringify(newPerson))
    await thisStore.flush()
  }

  static async getStoreList() {
    let thisStore = await PersonStore.getStore()
    let ListObject = thisStore.getAllSync() as object
    if (ListObject) {
      // 格式转换
      const listArray = Object.values(ListObject).map((item: string) => JSON.parse(item) as PersonModel)
      return listArray
    } else {
      return []
    }
  }

  static async getStoreItem(id: string) {
    let thisStore = await PersonStore.getStore()
    return JSON.parse(thisStore.getSync(id, JSON.stringify(new PersonModel({} as Person))) as string) as PersonModel
  }

  static async deleteStoreItem(id: string) {
    let thisStore = await PersonStore.getStore()
    thisStore.deleteSync(id)
    thisStore.flush()
  }
}