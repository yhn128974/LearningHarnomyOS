@Entry
@Component
struct DatePickerDialogDemo {
  selectedDate: Date = new Date('2010-1-1');

  build() {
    Column() {
      Button("DatePickerDialog")
        .margin(20)
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('1900-1-1'), // 设置选择器的起始日期
            end: new Date('2023-12-31'), // 设置选择器的结束日期
            selected: this.selectedDate, // 设置当前选中的日期
            lunar: false,
            onAccept: (value: DatePickerResult) => { // 点击弹窗中的“确定”按钮时触发该回调
              // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
              this.selectedDate.setFullYear(value.year, value.month, value.day)
              console.info('DatePickerDialog:onAccept()' + JSON.stringify(value))
            },

            onCancel: () => { // 点击弹窗中的“取消”按钮时触发该回调
              console.info('DatePickerDialog:onCancel()')
            },

            onChange: (value: DatePickerResult) => { // 滑动弹窗中的滑动选择器使当前选中项改变时触发该回调
              console.info('DatePickerDialog:onChange()' + JSON.stringify(value))
            }
          })
        })
    }
    .width('100%')
  }
}