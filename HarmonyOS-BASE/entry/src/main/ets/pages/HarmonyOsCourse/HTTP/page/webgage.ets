// @Entry
// @Component
// struct WebComponent{
//   @State dataFromHtml: string = ''
//   controller: WebController = new WebController()
//
//    testObj = {
//     test: (data) => {
//       this.dataFromHtml = data;
//       return 'ArkUI Web Component';
//     },
//     toString: () => {
//       console.log('Web Component toString');
//     }
//   }
//
//   build() {
//     Column() {
//       Text(this.dataFromHtml).fontSize(20)
//       Row() {
//         Button('Register JavaScript To Window').onClick(() => {
//           this.controller.registerJavaScriptProxy({
//             object: this.testObj,
//             name: 'objName',
//             methodList: ['test', 'toString'],
//           });
//           this.controller.refresh();
//         })
//       }
//
//       Web({ src: $rawfile('index.html'), controller: this.controller })
//         .javaScriptAccess(true)
//     }
//   }
// }