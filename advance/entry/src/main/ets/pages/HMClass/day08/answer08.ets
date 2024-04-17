interface IProduct {
  name: string,
  price: number,
  description: string
}
class ProductList <T extends IProduct> {
  private products: Array<T>;
  constructor(products: Array<T>) {
    this.products = products
  }
  render: () => void = () => {
    for (let i = 0; i < this.products.length; i++) {
      console.log(`序号:${i + 1},商品名:${this.products[i].name} ,商品价格:${this.products[i].price},商品描述:${this.products[i].description}`)
      console.log('---------------------------------------')
    }
  }
}

interface Book extends IProduct {
  author: string
  pages: number
  name: string
  price: number
  description: string
}

interface Clothing extends IProduct {
  size: string
  color: string
  name: string
  price: number
  description: string
}
// 创建书籍列表
const books: Book[] = [{
  name: "三国演义",
  price: 10,
  description: "《三国演义》与《西游记》《水浒传》《红楼梦》并称为中国古典四大名著。",
  author: "罗贯中",
  pages: 688
}, {
  name: "西游记 ",
  price: 12,
  description: "西游记》是中国古代第一部浪漫主义章回体长篇神魔小说",
  author: "吴承恩",
  pages: 500
}];
// 创建服装列表
const clothing: Clothing[] = [{
  name: "T恤",
  price: 15,
  description: "T恤（体恤），又称T恤衫（体恤衫）、丅字衫，是春夏季人们最喜欢的服装之一",
  size: "M",
  color: "Blue"
}, {
  name: "马甲",
  price: 40,
  description: "马甲是一种无领无袖，且较短的上衣。",
  size: "L",
  color: "Black"
}]
let prodectlist = new ProductList(clothing)
prodectlist.render()

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


//
// //1.定义接口 IProduct
// interface  IProduct{
//   name:string
//   price:number
//   description:string
// }
// //2.定义类ProductList
// class ProductList< T extends IProduct  >{
//
//   private  products: T[];
//
//   constructor(products: T[]) {
//     this.products = products;
//   }
//
//   //渲染
//   render(){
//     for (let i = 0;i<this.products.length;i++){
//       console.log('商品列表:')
//       console.log(`商品序号  ${i+1} :`)
//       console.log(`商品名称  ${this.products[i].name} `)
//       console.log(`商品价格  $${this.products[i].price} `)
//       console.log(`商品商品描述  ${this.products[i].description} `)
//       console.log(`---------------------------------------------- `)
//     }
//
//   }
// }
//
// // -- 定义书籍类型
// interface  Book extends IProduct{
//   author:string
//   pages:number
// }
//
// // // 创建书籍列表
// const books: Book[] = [
//   {
//     name: "三国演义",
//     price: 10,
//     description: "《三国演义》与《西游记》《水浒传》《红楼梦》并称为中国古典四大名著。",
//     author: "罗贯中",
//     pages: 688
//   },
//   {
//     name: "西游记 ",
//     price: 12,
//     description: "西游记》是中国古代第一部浪漫主义章回体长篇神魔小说",
//     author: "吴承恩",
//     pages: 500
//   }
// ];
//
//
// // ------ 测试 -
// const bookList = new ProductList<Book>(books)
// bookList.render()
//
//
//
//
// // --------------------------------------------------------------------
//
// //定义接口 CIothing
// interface Clothing extends IProduct{
//   size:string
//   color:string
// }
//
// // 创建服装列表
// const clothing: Clothing[] = [
//   {
//     name: "T恤",
//     price: 15,
//     description: "T恤（体恤），又称T恤衫（体恤衫）、丅字衫，是春夏季人们最喜欢的服装之一",
//     size: "M",
//     color: "Blue"
//   },
//   {
//     name: "马甲",
//     price: 40,
//     description: "马甲是一种无领无袖，且较短的上衣。",
//     size: "L",
//     color: "Black"
//   }
// ]
//
// // ------ 测试 -
// const bookList2 = new ProductList<Clothing>(clothing)
// bookList2.render()







