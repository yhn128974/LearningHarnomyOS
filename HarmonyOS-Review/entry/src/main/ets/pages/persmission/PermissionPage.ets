import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { geoLocationManager } from '@kit.LocationKit';

@Entry
@ComponentV2
struct PermissionPage {
  @Local locationResult: geoLocationManager.Location = {} as geoLocationManager.Location
  @Local message: string = 'Hello World';

  aboutToAppear(): void {

  }

  build() {
    Column() {
      Text(`经度:${this.locationResult.latitude ? this.locationResult.latitude :
        "0"},维度:${this.locationResult.longitude ? this.locationResult.longitude : "0"}`)

      Button('get permission').onClick((event: ClickEvent) => {
        //权限管理器
        const manager = abilityAccessCtrl.createAtManager()
        //requestPermissionsFromUser的第一个参数是ability上下文
        manager.requestPermissionsFromUser(this.getUIContext().getHostContext() as common.UIAbilityContext,
          ["ohos.permission.APPROXIMATELY_LOCATION", "ohos.permission.LOCATION"])
      })

      Button('get permission again').onClick((event: ClickEvent) => {
        const manager = abilityAccessCtrl.createAtManager()
        //requestPermissionOnSetting,吧这个权限弹出来，让用户再次选择
        manager.requestPermissionOnSetting(this.getUIContext().getHostContext() as common.UIAbilityContext,
          ["ohos.permission.APPROXIMATELY_LOCATION"])
      })

      Button('GET CURRENT LOCATION').onClick(async () => {
        this.locationResult = await geoLocationManager.getCurrentLocation()
      })

      Button('go to setting').onClick(() => {
        const currentContext = this.getUIContext().getHostContext() as common.UIAbilityContext

        currentContext.startAbility({
          deviceId: "",
          bundleName: 'com.huawei.hmos.settings', //设置应用bundleName
          abilityName: 'com.huawei.hmos.settings.MainAbility', //设置应用abilityName
          uri: "application_info_entry",
          parameters: {
            pushParams: 'com.example.myapplication '//这里必须是自己的报名
          }
        })
      })

    }
    .height('100%')
    .width('100%')
  }
}