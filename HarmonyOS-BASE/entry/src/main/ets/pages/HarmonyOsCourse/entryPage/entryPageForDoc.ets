import { common, Want } from '@kit.AbilityKit';

@Entry
@Component
struct EntryPageForDoc {
  @State message: string = 'here is the entry page for to docability page ';
  private context = getContext(this) as common.UIAbilityContext;
  @State index: number = 0;
  @State docs: number[] = []

  build() {

    Column() {

      Button('新建文档').onClick(() => {

        this.docs.push(this.index++)


      })
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      ForEach(this.docs, (id: number) => {
        Row({
          space: 10
        }) {
          Image($r('app.media.app_icon')).width(10)
          Text(`文档${id}`)
        }.onClick(() => {
          //   跳转到文档编辑的UIAbility
          let want: Want = {
            deviceId: '',
            bundleName: 'com.example.myapplication',
            moduleName: 'entry',
            abilityName: 'DocumentAbility',
            parameters: {
              intanceKey: 'idx_' + this.index++,
            }
          }
          // 跳转
          this.context.startAbility(want)
        })

      })


    }
    .width('100%').height('100%')

  }
}