import { promptAction, PromptAction } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'
import { UIAbility } from '@kit.AbilityKit';


@Entry()
@ComponentV2
struct Index {
  //获取上下文对象（方便跳转使用）,不要在使用getcontext()
  abilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext

  // self是要共享的


  build() {
    Column() {
      Text("hello harmony")
        .fontSize(50)
        .fontColor(Color.Red)
        .backgroundColor(Color.Gray)
        .width("100%")
        .height(100)

      Button('go to foodAbility').onClick(() => {
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.myapplication',
          moduleName: "entry",
          abilityName: "FoodAbility",
          parameters: {
            info: "the information come from entry ability"
          }
        }
        //通过获取uiContext的上下文来获取Ability的上下文
        this.abilityContext.startAbility(wantInfo)

      })
    }
    .width('100%')
    .height('100%')

  }
}