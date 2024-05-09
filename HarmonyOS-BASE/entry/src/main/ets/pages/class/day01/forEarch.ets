interface fontandcolor {
  color: string;
  title: string
}

let arrays: Array<number> = [123, 34, 45]
// 元组类型
let names: [string, number] = ['asd', 123];

// let longyou:unknown=23;

// 联合类型
let myfavoriteName: number|string=23;

// 默认参数
 let buildname=(firstname:string,lastname:string='yu',):string=>{
  if(lastname){
    return `${firstname}${lastname}`;
  }else {
    return`${firstname}`;
  }
}
console.log(buildname('Ethan'),buildname('Ethan','long'));

// 函数的可选参数
let buildname1=(firstname:string,lastname?:string):string=>{
  if(lastname){
    return `${firstname}${lastname}`;
  }else {
    return`${firstname}`;
  }
}
console.log(buildname1('Ethan'),buildname1('Ethan','long'));


@Entry
@Component
struct Index {

  @State fontinformation: fontandcolor[] = [
    {
      color: '#123',
      title: '电子产品'
    },
    {
      color: '#566',
      title: '精品服饰'
    },
    {
      color: '#677',
      title: '母婴产品'
    },
    {
      color: '#899',
      title: '影音娱乐'
    }
  ]

  // @State colors:string[] = ['#FF7503','#F9B508','#00B7FF','#CA64EA']

  build() {
    Row() {
      Column() {
        ForEach(this.fontinformation, (item: fontandcolor, index: number) => {
          Text(item.title).fontSize(14).fontWeight(FontWeight.Bold).fontColor(item.color)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

