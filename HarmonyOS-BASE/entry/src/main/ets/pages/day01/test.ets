//
// let arrays:number[] = [10,30,34,45,56]
// for (let i = 0; i < arrays.length; i++){
//   if (arrays[i] == 30){
//     console.log('wo~ you are my good number',arrays[i]);
//   }
// }
//
// let  getRandom=(nm1:number):number=>{
//   return Math.random()*nm1
// }


let getapplepayment=(count:number,kg:number,fruit:string):string =>{
  return `${count}斤${fruit}的价格是${count*kg}`
}
console.log(getapplepayment(2,3,'苹果'))
console.log(getapplepayment(4,4,'香蕉'))



//
// console.log("随机数"+getRandom(11));


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

