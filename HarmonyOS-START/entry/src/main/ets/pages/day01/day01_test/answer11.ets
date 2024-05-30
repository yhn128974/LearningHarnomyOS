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



// 1. 将单位保存起来待使用
enum Unit {
  PriceU = '元',
  WeightU = '斤'
}

// 2. 水果店库存罗列 苹果 -- 20斤 香蕉 -- 20斤 橘子 -- 20斤
const fruits: number[] = [20, 20, 20]
// 3.消费总额, 顾客购买了5斤苹果, 每斤10元; 4斤橘子,每斤8元
console.log('---------消费总额----------')
let orangePrice:number=8
let orangeWeight:number=4
let applesPrice:number=10
let applesWeight:number=5

console.log( `消费:${orangePrice*orangeWeight+applesPrice*applesWeight} ${Unit.PriceU}`)
// 4. 输出剩余库存
console.log('---------商店库存----------')
const newFruits:Array<Number>=[]
newFruits.push(fruits[0]-applesWeight,fruits[1],fruits[2]-orangeWeight)

console.log(` 苹果:${newFruits[0]} `+Unit.WeightU)
console.log(` 香蕉:${newFruits[1]} `+Unit.WeightU)
console.log(` 橘子:${newFruits[2]} `+Unit.WeightU)
// 5. 消费明细打印
// 5.1 封装函数,进行统一处理

// 5.2 调用函数输出 单品消费明细
console.log('----------消费明细----------')

function getAppleSellDetail(){
  console.log(`苹果: 单价${applesPrice} ${Unit.PriceU} 重量 ${applesWeight} ${Unit.WeightU} 小计${orangePrice*orangeWeight}`)
  console.log(`橘子: 单价${orangePrice} ${Unit.PriceU} 重量 ${orangeWeight} ${Unit.WeightU} 小计${orangePrice*orangeWeight}`)
}
getAppleSellDetail()




