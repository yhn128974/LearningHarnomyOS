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

let today: string = '20240101'
const date: Date = new Date()
today = date.getFullYear().toString() + date.getMonth() + date.getDate()
console.log(today)


const message1: string = '123|456|789'
const message2: string = 'abc|def|hig'

const branchFilterStr: string[] = message1.split('|').map((item: string) => {
  return item.trim()
})

console.log("" + branchFilterStr)

class TitleItem {
  title_zn: string = ''
  title_en: string = ''
}

const title: string = 'hello|你好,热度|heroInfo,胜率|winRate'
let titleItemList: TitleItem[] = title.split(',').map((item: string) => {
  let titleItem: TitleItem = {
    title_zn: item.split('|')[0],
    title_en: item.split('|')[1]
  }
  return titleItem
})

for (let item of titleItemList) {
  console.log(item.title_en + item.title_zn)
}







