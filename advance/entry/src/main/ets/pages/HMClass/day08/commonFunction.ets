import map from '@hms.core.map.map';

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


// const arr1: number[] = [1, 2, 3]
// const arr2: number[] = [4, 5, 6]
// let arr3: number[] = arr1.concat(arr2)
// arr1[0] = 9
// arr3=arr1.concat(arr2)
//
// console.log("" + arr3)
// //反转
// const reversedArr=arr1.reverse()
// console.log(reversedArr+"")
//
// //splice 拼接
// const array1:number[]=[1,2,3,4,5];
// // splice返回的数组就是提取的数组
// const res:number[]=array1.splice(1,3)
// console.log(array1.toString())
// console.log(res.toString())

// slice(切片)
const Array1: number[] = [1, 2, 3, 4, 5];

const Array2: number[] = Array1.slice()
console.log(Array2.toString());

const Array3: number[] = Array1.slice(1)
console.log(Array3.toString());

const Array4: number[] = Array1.slice(1, 3)
console.log(Array4.toString());

// incluses
const array1 = [1, 2, 3]
console.log(array1.includes(1).toString());

// indexof (获取索引)
const beasts = ['ant', 'bison', 'cam']
console.log(beasts.indexOf('bison').toString())

// join拼接
const elements = ['Fire', 'Air', 'Water']
console.log(elements.join())
console.log(elements.join(''))
console.log(elements.join('_'))

const array2: number[] = [1, 2, 3]

const array3 = array2.map((item: number, index: number) => {
  return ++item
})
console.log(array3.toString())

const array4 = array2.filter((item: number, index: number) => {
  return item > 1;
})
console.log(array4.toString())


// every （是否都满足要求 ）返回boolean
enum Male {
  'man',
  'woman'
}

class Person {
  name: string = ''
  male: Male = Male.man
}

const list: Person[] = [
  {
    name: '张三',
    male: Male.woman
  },
  {
    name: '李四',
    male: Male.man
  }, {
  name: '王五',
  male: Male.woman
}, {
  name: '赵六',
  male: Male.man
}
]
// 是否每个都满足
const isAllman: Boolean = list.every((item: Person, index: number) => {
  if (item.male === Male.man) {
    return true
  } else {
    return false
  }
})

console.log(isAllman.toString());
// 是否有一个满足
const haveman: Boolean = list.some((item: Person, index: number) => {
  if (item.male === Male.man) {
    return true
  } else {
    return false
  }
})

console.log(haveman.toString());

const ARRAY: number[] = [5, 12, 8, 130, 44];

ARRAY.sort((a: number, b: number) => {
  // a-b正序
  // b-a倒序
  return a - b
})

console.log(ARRAY.toString());

// reduce（求和）
class Fruit {
  name: string = ''
  price: number = 0
}

const fruitList: Fruit[] = [
  {
    name: '西瓜',
    price: 10
  },
  {
    name: '哈密瓜',
    price: 15
  },
  {
    name: '菠萝',
    price: 6
  },
]

let count = fruitList.reduce((prev: number, next: Fruit) => {
  return prev + next.price;
}, 0)

console.log(count.toString())

class Person01 {
  name: string = '';
  age: number = 0;
  male: boolean = false;
}

const p: Person01 = {
  name: 'jack',
  age: 20,
  male: true
}

const keys: string[] = Object.keys(p)
console.log(keys.toString())


// String对象的方法 slice
const str = 'the quick brown fox jumped over the lazy dog';
const words = str.split(' ');
console.log(words[2]);


let count1: number = setInterval(() => {
  console.log('hello there!')
}, 1000)

setTimeout(() => {
  clearInterval(count1)
}, 5000)


















