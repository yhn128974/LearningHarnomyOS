// 额外获取带有metadataArray信息的appInfo
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { Log } from '@abner/log/src/main/ets/Log';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { access } from '@kit.ConnectivityKit';

class EcBlueAuth {
  // 检测蓝牙授权
  async checkBluePermission(callback: () => void) {
    //bundleFlags,指定返回的BundleInfo所包含的信息。
    let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;

    try {
      // 1. 获取应用信息 :系统应用可以通过bundleManager.getApplicationInfo获取,
      // 普通应用可以通过bundleManager.getBundleInfoForSelf获取
      const bundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags)

      // 2. abilityAccessCtrl.createAtManager创建权限管理器
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

      // 3.指定需要检测的权限类型
      let permissionName: Permissions = 'ohos.permission.ACCESS_BLUETOOTH';

      // 4.checkAccessTokenSync(tokenID: number, permissionName: Permissions): GrantStatus 获取当前蓝牙状态信息码 （）
      let data: abilityAccessCtrl.GrantStatus =
        atManager.checkAccessTokenSync(bundleInfo.appInfo.accessTokenId, permissionName);

      // 条件一 如果权限状态为拒绝
      if (data === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
        // 未授权：请求用户授权
        this.reqUserPermission(callback)
        return
      }
      // 条件二
      if (!this.isBlueOpen()) {
        AlertDialog.show({
          message: '请打开蓝牙开关'
        })
        return
      }
      //执行回调函数
      callback && callback()
    } catch (err) {
      let message = (err as BusinessError).message;
      Log.error(message)
    }
  }

  // 向用户申请授权
  reqUserPermission(callback: () => void) {
    // abilityAccessCtrl.createAtManager创建权限管理器
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

    // 使用UIExtensionAbility：将common.UIAbilityContext 替换为common.UIExtensionContext
    let context: Context = getContext(this) as common.UIAbilityContext;

    // abilityAccessCtrl.AtManager.requestPermissionsFromUser(context,[权限数组],()=>{回调函数}) 向用户申请权限
    atManager.requestPermissionsFromUser(context, ['ohos.permission.ACCESS_BLUETOOTH'],
      (err: BusinessError, data: PermissionRequestResult) => {
        if (err) {
          Log.error(`requestPermissionsFromUser fail, err->${JSON.stringify(err)}`);
        } else {
          // 获取用户的操作信息
          Log.info('data:' + JSON.stringify(data));

          if (data.authResults[0] === 0) {
            if (this.isBlueOpen()) {
              // Log.info('go')
              // 满足全部条件执行回调函数
              callback && callback()
            } else {
              AlertDialog.show({ message: '请打开蓝牙开关' })
            }
          } else {
            // 未授权
            AlertDialog.show({
              message: '请前往系统页面授权蓝牙权限后，才能继续绑定操作！'
            })
          }
        }
      });
  }

  // 判断当前蓝牙开关是否打开
  isBlueOpen() {
    try {
      // 获取当前蓝牙状态码
      const state = access.getState()
      if (state === access.BluetoothState.STATE_ON) {
        return true
      } else {
        return false
      }
    } catch (e) {
      Log.error('ble_demo_log' + e.message)
      return false
    }
  }
}

export const ecBlue = new EcBlueAuth()