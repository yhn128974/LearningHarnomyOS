import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyboardAvoidMode, window, } from '@kit.ArkUI';
import { TokenManager } from '../pages/HMClassOnline/day13/preferences/my_perferences';


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

//
// export  class UserInfoClass {
//   name?: string = ""
//   age?: number = 0
// }
// let user: Record<string, UserInfoClass> = { "user": {
//   name: '水若寒宇',
//   age: 34
// }};
// const sharedStorage = new LocalStorage(user)

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 根据用户首选项的 TokenManager.getToken(this.context)的存在来判断ability的入口
    // windowStage.loadContent(await TokenManager.getToken(this.context) ?'pages/HMClassOnline/day13/preferences/Pages/Home':'pages/HMClassOnline/day13/preferences/Pages/Login',,)

    windowStage.loadContent('pages/HMClassOnline/day16/KeyCase', carInfo_localStorage, (err, data) => {
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

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
