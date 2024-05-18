import { abilityAccessCtrl, AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyboardAvoidMode, window, } from '@kit.ArkUI';
import { preferences } from '@kit.ArkData';


export interface Car {
  name: string,
  color: ResourceColor,
  engine: string
}

export class CarModel implements Car {
  name: string = ''
  color: ResourceColor = Color.White
  engine: string = ''

  constructor(model: Car) {
    this.name = model.name
    this.color = model.color
    this.engine = model.engine
  }
}

let carInfo: Record<string, CarModel> = {
  "BMW": new CarModel({
    name: 'BMW7se',
    color: Color.Blue,
    engine: 'electric'
  })
}

export const carInfo_localStorage: LocalStorage = new LocalStorage(carInfo)


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // 获取权限
    const manager = abilityAccessCtrl.createAtManager()
    await manager.requestPermissionsFromUser(this.context,
      [
        "ohos.permission.APPROXIMATELY_LOCATION",
        "ohos.permission.INTERNET"
      ])



    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');


    // 设置WindowStage的事件订阅（获焦/失焦、可见/不可见）
    try {
      windowStage.on('windowStageEvent', (data) => {
        let stageEventType: window.WindowStageEventType = data;
        switch (stageEventType) {
          case window.WindowStageEventType.SHOWN: // 切到前台
            console.info('windowStage foreground.');
            break;
          case window.WindowStageEventType.ACTIVE: // 获焦状态
            console.info('windowStage active.');
            break;
          case window.WindowStageEventType.INACTIVE: // 失焦状态
            console.info('windowStage inactive.');
            break;
          case window.WindowStageEventType.HIDDEN: // 切到后台
            console.info('windowStage background.');
            break;
          default:
            break;
        }
      });
    } catch (exception) {
      console.error('Failed to enable the listener for window stage event changes. Cause:' + JSON.stringify(exception));
    }

    // 根据用户首选项的 TokenManager.getToken(this.context)的存在来判断ability的入口
    // windowStage.loadContent(await TokenManager.getToken(this.context) ?'pages/HMClassOnline/day13/preferences/Pages/Home':'pages/HMClassOnline/day13/preferences/Pages/Login',,)

    windowStage.loadContent('pages/HMClassOnline/Series3/day08/http/AxiosCase01', carInfo_localStorage, (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');

      // 设置键盘避让
      windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)

    });
    // 设置app全屏显示
    // windowStage.getMainWindowSync().setWindowLayoutFullScreen(true)

  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
}
