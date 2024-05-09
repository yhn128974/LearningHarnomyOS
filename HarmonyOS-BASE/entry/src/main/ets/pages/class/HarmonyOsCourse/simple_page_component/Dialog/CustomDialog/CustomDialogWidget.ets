// import HobbyBean from './HobbyBean';
//
// @CustomDialog
// export default struct CustomDialogWidget {
//   @State hobbyBeans: HobbyBean[] = [];
//   @Link hobbies: string;
//   private controller?: CustomDialogController;
//
//   aboutToAppear() {}
//
//   setHobbiesValue(hobbyBeans: HobbyBean[]) {
//     let hobbiesText: string = '';
//     hobbiesText = hobbyBeans.filter((isCheckItem: HobbyBean) =>
//     isCheckItem?.isChecked)
//       .map((checkedItem: HobbyBean) => {
//         return checkedItem.label;
//       }).join(',');
//     this.hobbies = hobbiesText;
//   }
//
//   build() {
//     Column() {
//       Text($r('app.string.text_title_hobbies'))
//       List() {
//         ForEach(this.hobbyBeans, (itemHobby: HobbyBean) => {
//           ListItem() {
//             Row() {
//               Text(itemHobby.label)
//               Toggle({ type: ToggleType.Checkbox, isOn: false })
//               .onChange((isCheck) => {
//                 itemHobby.isChecked = isCheck;
//               })
//             }
//           }
//         }, itemHobby => itemHobby.label)
//       }
//
//       Row() {
//         Button($r('app.string.cancel_button'))
//         .onClick(() => {
//           this.controller?.close();
//         })
//         Button($r('app.string.definite_button'))
//         .onClick(() => {
//           this.setHobbiesValue(this.hobbyBeans);
//           this.controller?.close();
//         })
//       }
//     }
//
//  @Entry
// @Component
// struct HomePage {
//   customDialogController: CustomDialogController = new CustomDialogController({
//     builder: CustomDialogWidget({
//       onConfirm: this.setHobbiesValue.bind(this),
//     }),
//     alignment: DialogAlignment.Bottom,
//     customStyle: true,
//     offset: { dx: 0,dy: -20 }
//   });
//
//   setHobbiesValue(hobbyArray: HobbyBean[]) {...}
//
//   build() {
//
//       TextCommonWidget({
//
//         title: $r('app.string.title_hobbies'),
//         content: $hobby,
//         onItemClick: () => {
//           this.customDialogController.open();
//         }
//       })
//
// }
//   }
// }