import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import promptAction from '@ohos.promptAction';

const TAG: string = '[Page_Context]';
const DOMAIN_NUMBER: number = 0xFF00;

@Entry
@Component
struct Page_Context {

  // Context的典型使用场景
  // 本章节通过如下典型场景来介绍Context的用法：
  //
  // 获取应用文件路径
  // 获取和修改加密分区
  // 创建其他应用或其他Module的Context
  // 订阅进程内UIAbility生命周期变化

  build() {
    Column() {
      //获取应用文件路径
      // 基类Context提供了获取应用文件路径的能力，ApplicationContext、AbilityStageContext、UIAbilityContext和ExtensionContext均继承该能力。
      // 应用文件路径属于应用沙箱路径，具体请参见应用沙箱目录。
      //
      // 上述各类Context获取的应用文件路径有所不同。
      //
      // 通过ApplicationContext获取应用级别的应用文件路径，此路径是应用全局信息推荐的存放路径，这些文件会跟随应用的卸载而删除。
      Button('获取系统文件')
        .onClick(() => {
          let context = getContext(this) as common.UIAbilityContext;
          let applicationContext = context.getApplicationContext();
          let cacheDir = applicationContext.cacheDir;
          let tempDir = applicationContext.tempDir;
          let filesDir = applicationContext.filesDir;
          let databaseDir = applicationContext.databaseDir;
          let bundleCodeDir = applicationContext.bundleCodeDir;
          let distributedFilesDir = applicationContext.distributedFilesDir;
          let preferencesDir = applicationContext.preferencesDir;
          // 获取应用文件路径
          let filePath = tempDir + 'test.txt';
          hilog.info(DOMAIN_NUMBER, TAG, `filePath: ${filePath}`);
          if (filePath !== null) {
            promptAction.showToast({
              message: filePath
            });
          }

        })

      Divider()

      //通过AbilityStageContext、UIAbilityContext、ExtensionContext获取HAP级别的应用文件路径。
      // 此路径是HAP相关信息推荐的存放路径，这些文件会跟随HAP的卸载而删除，但不会影响应用级别路径的文件，除非该应用的HAP已全部卸载。
      Button('获取UIAbility文件')
        .onClick(() => {
          let context = getContext(this) as common.UIAbilityContext;
          let cacheDir = context.cacheDir;
          let tempDir = context.tempDir;
          let filesDir = context.filesDir;
          let databaseDir = context.databaseDir;
          let bundleCodeDir = context.bundleCodeDir;
          let distributedFilesDir = context.distributedFilesDir;
          let preferencesDir = context.preferencesDir;
          // 获取应用文件路径
          let filePath = tempDir + 'test.txt';
          hilog.info(DOMAIN_NUMBER, TAG, `filePath: ${filePath}`);
          if (filePath !== null) {
            promptAction.showToast({
              message: `${context.area} ,${filePath}`
            });
          }
        })
    }

  }
}