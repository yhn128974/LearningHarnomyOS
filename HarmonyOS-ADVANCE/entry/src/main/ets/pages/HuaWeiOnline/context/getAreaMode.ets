import UIAbility from '@ohos.app.ability.UIAbility';
import contextConstant from '@ohos.app.ability.contextConstant';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import { promptAction } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // 存储普通信息前，切换到EL1设备级加密
    this.context.area = contextConstant.AreaMode.EL1; // 切换area
    // 存储普通信息

    // 存储敏感信息前，切换到EL2用户级加密
    this.context.area = contextConstant.AreaMode.EL2; // 切换area
    // 存储敏感信息

    // 存储敏感信息前，切换到EL3用户级加密
    this.context.area = contextConstant.AreaMode.EL3; // 切换area
    // 存储敏感信息

    // 存储敏感信息前，切换到EL4用户级加密
    this.context.area = contextConstant.AreaMode.EL4; // 切换area
    // 存储敏感信息
  }
}

@Entry
@Component
struct Page_Context {
  private context = getContext(this) as common.UIAbilityContext;

  build() {
    Column() {
      Button()
        .onClick(() => {
          // 存储普通信息前，切换到EL1设备级加密
          if (this.context.area === contextConstant.AreaMode.EL2) { // 获取area
            this.context.area = contextConstant.AreaMode.EL1; // 修改area
            promptAction.showToast({
              message: 'EL1'
            });
          }
          // 存储普通信息
        })
      Button()
        .onClick(() => {
          // 存储敏感信息前，切换到EL2用户级加密
          if (this.context.area === contextConstant.AreaMode.EL1) { // 获取area
            this.context.area = contextConstant.AreaMode.EL2; // 修改area
            promptAction.showToast({
              message:'EL2'
            });
          }
          // 存储敏感信息
        })
    }

  }
}