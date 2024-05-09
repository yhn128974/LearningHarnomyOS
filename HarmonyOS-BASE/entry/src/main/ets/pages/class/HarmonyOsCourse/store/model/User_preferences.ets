// // PreferencesUtil.ets
// import dataPreferences from '@ohos.data.preferences';
//
// const PREFERENCES_NAME = 'myPreferences'; // 首选项名字
// const KEY_APP_FONT_SIZE = 'appFontSize';  // 首选项Key字段
//
//
// // entryAbility.ets
// onCreate(want, launchParam) {
//   Logger.info(TAG, 'onCreate');
//   globalThis.abilityWant = want;
//   // 创建首选项
//   PreferencesUtil.createFontPreferences(this.context);
//
// }
// // PreferencesUtil.ets
// createFontPreferences(context) {
//   globalThis.getFontPreferences = (() => {
//     // 获取首选项实例
//     let preferences: Promise = dataPreferences.getPreferences(context, PREFERENCES_NAME);
//     return preferences;
//   });
// }
//
// // entryAbility.ets
// onCreate(want, launchParam) {
//   Logger.info(TAG, 'onCreate');
//   globalThis.abilityWant = want;
//
//   // 设置字体默认大小
//   PreferencesUtil.saveDefaultFontSize(Constants.SET_SIZE_STANDARD);
// }
//
// // PreferencesUtil.ets
// saveDefaultFontSize(fontSize: number) {
//   globalThis.getFontPreferences().then((preferences) => {
//     // 判断保存的key是否存在
//     preferences.has(KEY_APP_FONT_SIZE).then(async (isExist) => {
//       Logger.info(TAG, 'preferences has changeFontSize is ' + isExist);
//       if (!isExist) {
//         // 保存数据
//         await preferences.put(KEY_APP_FONT_SIZE, fontSize);
//         preferences.flush();
//       }
//     }).catch((err) => {
//       Logger.error(TAG, 'Has the value failed with err: ' + err);
//     });
//   }).catch((err) => {
//     Logger.error(TAG, 'Get the preferences failed, err: ' + err);
//   });
// }
//
// // SetFontSizePage.ets
// @Entry
// @Component
// struct Index {
//   @State message: string = 'Hello World';
//   // HomePage.ets
//   onPageShow() {
//     PreferencesUtil.getChangeFontSize().then((value) => {
//       this.changeFontSize = value;
//       Logger.info(TAG, 'Get the value of changeFontSize: ' + this.changeFontSize);
//     });
//   }
//
//   // PreferencesUtil.ets
//   async getChangeFontSize() {
//     let fontSize: number = 0;
//     const preferences = await globalThis.getFontPreferences();
//     fontSize = await preferences.get(KEY_APP_FONT_SIZE, fontSize);
//     return fontSize;
//   }
//
//   // PreferencesUtil.ets
//   saveDefaultFontSize(fontSize: number) {
//     globalThis.getFontPreferences().then((preferences) => {
//       // 判断保存的key是否存在
//       preferences.has(KEY_APP_FONT_SIZE).then(async (isExist) => {
//         Logger.info(TAG, 'preferences has changeFontSize is ' + isExist);
//       }).catch((err) => {
//         Logger.error(TAG, 'Has the value failed with err: ' + err);
//       });
//     }).catch((err) => {
//       Logger.error(TAG, 'Get the preferences failed, err: ' + err);
//     });
//   }
//
//   // PreferencesUtil.ets
//   saveChangeFontSize(fontSize: number) {
//     globalThis.getFontPreferences().then(async (preferences) => {
//       // 保存数据
//       await preferences.put(KEY_APP_FONT_SIZE, fontSize);
//       // 数据持久化
//       preferences.flush();
//     }).catch((err) => {
//       Logger.error(TAG, 'put the preferences failed, err: ' + err);
//     });
//   }
//
//   // PreferencesUtil.ets
//   async deleteChangeFontSize() {
//     const preferences: dataPreferences.Preferences = await globalThis.getFontPreferences();
//     // 删除数据
//     let deleteValue = preferences.delete(KEY_APP_FONT_SIZE);
//     deleteValue.then(() => {
//       Logger.info(TAG, 'Succeeded in deleting the key appFontSize.');
//     }).catch((err) => {
//       Logger.error(TAG, 'Failed to delete the key appFontSize. Cause: ' + err);
//     });
//   }
//
//
//   build() {
//     Row() {
//       Slider({
//
//       }).onChange((value: number) => {
//         // 保存当前进度值
//         PreferencesUtil.saveChangeFontSize(this.changeFontSize);
//       })
//     }
//   }
// }
//
//
//
//
// // PreferencesUtil.ets
// saveChangeFontSize(fontSize: number) {
//   globalThis.getFontPreferences().then(async (preferences) => {
//     // 保存数据
//     await preferences.put(KEY_APP_FONT_SIZE, fontSize);
//     preferences.flush();
//   }).catch((err) => {
//     Logger.error(TAG, 'put the preferences failed, err: ' + err);
//   });
// }
//
//
