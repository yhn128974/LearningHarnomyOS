import AbilityStage from '@ohos.app.ability.AbilityStage';
import type Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    // 应用的HAP在首次加载的时，为该Module初始化操作
    let abilityStageContext=getContext(this)
  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    return 'MyAbilityStage';
  }

  // onConfigurationUpdate(config: Configuration) {
  //   console.log(`onConfigurationUpdate, language: ${config.language}`);
  // }

  // onMemoryLevel(){
  //
  // }
}

