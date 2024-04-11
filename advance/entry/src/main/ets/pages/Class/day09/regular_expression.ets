@Entry
@Component
struct expression {
  build() {
    Row() {

    }
  }
}

// 字符串方法
// 替换 replace
const str = '欢迎大家学习ArkTs,相信大家一定能学好ArkTs!!! ArkTS-NB'

const strEnd = str.replace(/ArkTs/, '鸿蒙开发')
console.log('res', strEnd)

const strEnd1 = str.replace(/ArkTs/i, '鸿蒙开发')
console.log('res', strEnd1)

const strEnd2 = str.replace(/ArkTs/g, '鸿蒙开发')
console.log('res', strEnd2)

const strEnd3 = str.replace(/ArkTs/ig, '鸿蒙开发')
console.log('res', strEnd3)
