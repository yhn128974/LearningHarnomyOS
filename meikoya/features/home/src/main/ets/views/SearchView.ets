import { AppSafeArea, PAGE_PATH } from 'basic'
import { AppStorageV2 } from '@kit.ArkUI'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'

@HMRouter({ pageUrl: PAGE_PATH.SEARCH_PAGE })
@ComponentV2
export struct SearchView {
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  @Local keyword: string = ''

  build() {
    Column() {
      // search
      Row() {
        Image($r('[basic].media.ic_public_left'))
          .width(24)
          .aspectRatio(1)
          .fillColor($r('[basic].color.white'))
          .margin(13)
          .onClick(() => {
            HMRouterMgr.pop()
          })
        Search({ placeholder: '商品关键字...', value: this.keyword })
          .searchIcon({ src: $r('[basic].media.ic_public_search'), color: $r('[basic].color.gray') })
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .searchButton('搜索', { fontSize: 14, fontColor: $r('[basic].color.red') })
          .backgroundColor($r('[basic].color.white'))
          .textFont({ size: 14 })
          .layoutWeight(1)
          .padding(0)
          .margin(0)
          .height(36)
          .caretStyle({ color: $r('[basic].color.red') })
          .defaultFocus(true)
          .onSubmit((value) => {
            HMRouterMgr.push({
              pageUrl: PAGE_PATH.SEARCH_RESULT_PAGE,
              param: { keyword: value }
            })
          })


      }
      .padding({ top: this.safeArea.topHeight, right: 16 })
      .linearGradient({
        angle: 135,
        colors: [[$r('[basic].color.linear_begin'), 0], [$r('[basic].color.linear_end'), 1]]
      })

      // 语音搜索组件
    }
  }
}

