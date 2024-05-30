// @Entry
// @Component
// struct Index {
//   @State message: string = 'Hello World';
//
//   build() {
//     Column({
//       space: 10
//     }) {
//       Stack({
//         alignContent:Alignment.Bottom
//       }){
//         Image($r('app.media.df')).width('100%').height(400).borderRadius({
//           topLeft:10,
//           topRight:10
//         })
//         Row() {
//           Row({
//             space:5
//           }) {
//             Image($r('app.media.bf')).width(24).height(24).fillColor(Color.White)
//             Text('228万').fontColor(Color.White).fontSize(24)
//           }
//           Row({
//             space:5
//           }) {
//             Image($r('app.media.buofang')).width(24).height(24).fillColor(Color.White)
//             Text('8655').fontColor(Color.White).fontSize(24)
//           }
//           Text('4:33').fontColor(Color.White).fontSize(24)
//         }.justifyContent(FlexAlign.SpaceBetween).padding({
//           left:5,
//           right:5
//         }).width('100%').padding(5)
//       }
//
//       Text('[凤凰传奇新歌] 欢迎来到国风统治区:唢呐一响神曲《铁衣架啊叭叭叭叭叭叭叭》').fontSize(24).textOverflow({
//         overflow:TextOverflow.Ellipsis
//       }).maxLines(2).lineHeight(24)
//
//       Row() {
//         Text('19万点赞').backgroundColor(Color.Pink).fontColor('red').fontSize(24).lineHeight(24)
//         Image($r('app.media.24gf')).height(24)
//       }.justifyContent(FlexAlign.SpaceBetween).width('100%')
//
//       .width('100%')
//     }
//     .height('100%').width('100%').borderRadius(10).margin({
//       top:6
//     })
//   }
// }
//
