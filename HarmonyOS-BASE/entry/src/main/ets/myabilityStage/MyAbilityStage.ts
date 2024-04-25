import { AbilityStage, Want } from '@kit.AbilityKit';


export default class MyAbilityStage extends AbilityStage {
  onAcceptWant(want: Want): string {
    if (want.abilityName === 'DocumentAbility') {
      return `DocAbilityInstance_${want.parameters.instanceKey}`
    }
    return ''
  }
}