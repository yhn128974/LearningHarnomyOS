import { hilog } from '@kit.PerformanceAnalysisKit';
import { fullScreenController, logger } from '../../commons/utils';
import { AppStorageV2, window } from '@kit.ArkUI';
import { AreaHeight } from '../../models/AreaHeight';
import { statusBar } from '../../commons/utils/StatusBar';


@Entry
@ComponentV2
struct Page {
  @Local currentAreaHeight: AreaHeight = AppStorageV2.connect(AreaHeight, () => {
    return new AreaHeight(0, 0)
  })!

  build() {
    Column() {

      /**
       参数 domain：用于指定输出日志所对应的业务领域，取值范围为 0x0000~0xFFFF，开发者可以根据需要进行自定义。
       参数 tag：用于指定日志标识，可以为任意字符串，建议标识调用所在的类或者业务行为。
       参数 format：格式字符串，用于日志的格式化输出。%{public}s=字符串, %{public}d=数字
       参数 args：可以为 0 个或多个参数，可以为 0 个或多个参数，是格式字符串中参数类型对应的参数列表
       **/

      Button("hilog.info测试").onClick(() => {
        hilog.info(0xB05C00, "interview", "%{public}s, %{public}s", "info", "info1");
      });

      Button("hilog.debug测试").onClick(() => {
        // debug表示调试日志，将来上线之后不会被执行
        hilog.debug(0x0000, "interview", "%{public}s, %{public}s", "debug", "debug1");
      });

      Button("hilog.warn测试").onClick(() => {
        // 警告日志
        hilog.warn(0x0000, "interview", "%{public}s, %{public}s", "warn", "warn1");
      });

      Button("hilog.error测试").onClick(() => {
        // 错误日志，当代码出错时调用
        hilog.error(0x0000, "interview", "%{public}s, %{public}s", "error", "error1");
      });

      Button("hilog.fatal测试").onClick(() => {
        // 错误日志，当代码出错时调用
        hilog.fatal(0x0000, "interview", "%{public}s, %{public}s", "fatal", "fatal1");
      });

      Button('HilogText').onClick(() => {
        logger.warn('hello', 'world')
      })

      Button('开启沉浸式').onClick(async () => {

        statusBar.setLightBar()

        fullScreenController.enable()

      })
      Button('关闭沉浸式').onClick(async () => {
        statusBar.setDarkBar()

        fullScreenController.disable()

      })
      Button('改变状态栏字体颜色').onClick(async () => {
        statusBar.setStatusBar({
          statusBarContentColor: "#ffff00"
        })
      })

    }
    .height('100%')
    .width('100%')
    .padding({
      top: this.currentAreaHeight.voidAreaTopHeight,
      bottom: this.currentAreaHeight.voidAreaBottomHeight
    })

    .backgroundColor(Color.Orange)
  }
}