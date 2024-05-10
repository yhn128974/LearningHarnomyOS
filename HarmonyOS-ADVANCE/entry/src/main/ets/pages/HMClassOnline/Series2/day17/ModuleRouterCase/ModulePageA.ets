// import { router } from '@kit.ArkUI';
//
// //  模块之间进行路由跳转引入依赖对应的页面
// import('@ohos/library/src/main/ets/pages/Index')
//
// @Entry
// @Component
// struct ModulePageA {
//   @State message: string = 'ModulePageA Page';
//
//   build() {
//     Row() {
//       Column() {
//         Text(this.message)
//           .fontSize(50)
//           .fontWeight(FontWeight.Bold)
//         Divider()
//         Button('Route to payment Page by route').onClick((event: ClickEvent) => {
//           // 模块之间进行路由跳转
//           router.pushUrl({
//             url: '@bundle:com.example.myapplication/library/ets/pages/Index'
//           })
//         })
//         Button('Route to payment Page by name').onClick((event: ClickEvent) => {
//           // 模块之间进行路由跳转
//           router.pushNamedRoute({
//             name: "pay_index"
//           })
//         })
//       }
//       .width('100%')
//     }
//     .height('100%')
//   }
// }