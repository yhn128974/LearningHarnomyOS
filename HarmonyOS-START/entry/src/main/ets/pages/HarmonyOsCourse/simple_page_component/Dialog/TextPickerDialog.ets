@Entry
@Component
struct TextPickerDialogDemo {
  @State select: number = 2;
  private fruits: string[] = ['苹果', '橘子', '香蕉', '猕猴桃', '西瓜'];

  build() {
    Column() {
      Text(this.fruits[this.select]).fontSize(30)

      Button('TextPickerDialog')
        .margin(20)
        .onClick(() => {
          TextPickerDialog.show({

            range: this.fruits, // 设置文本选择器的选择范围
            selected: this.select, // 设置初始选中项的索引值。

            onAccept: (value: TextPickerResult) => {
              // 点击弹窗中的“确定”按钮时触发该回调。
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index as number;
              console.info("TextPickerDialog:onAccept()" + JSON.stringify(value));
            },
            onCancel: () => { // 点击弹窗中的“取消”按钮时触发该回调。
              console.info("TextPickerDialog:onCancel()");
            },
            onChange: (value: TextPickerResult) => { // 滑动弹窗中的选择器使当前选中项改变时触发该回调。
              console.info('TextPickerDialog:onChange()' + JSON.stringify(value));
            }
          })
        })
    }
    .width('100%')
  }
}