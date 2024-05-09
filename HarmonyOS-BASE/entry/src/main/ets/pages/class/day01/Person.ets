

interface Person{
  name:string,
  age:number,
  weight:string|number,
  dance:()=>void,
}

let Student:Person={
  name:"",
  age:0,
  weight:50,
  dance:()=>{
    console.log("I can dance with you")
  },
}



class Person2{
  private  name: string
  private  age:number
  constructor(name:string, age:number){
    this.name=name
    this.age=age
  }
  public  getinformation():string{
    return `${this.name} - ${this.age}`
  }
}
let person1=new Person2('longuyou',20);
console.log(person1.getinformation())

class Person3 extends Person2{
  private sex:string;
  constructor(name:string,age:number,sex:string,){
    super(name, age);
    this.sex=sex;
  }
  public getinformation():string{
    return this.getinformation()+this.sex
  }
}


// 联合类型
let gender:'man'|'woname'|'sercte'='woname'
gender ='sercte'
console.log('性别是' +gender);

let numbers:213|23|23=23;

// 枚举
enum Colors {
  // 类型用大写字母开头
  Red='#ff0000', Green="#00ff00", Blue='#00f'
}
let newColor:Colors=Colors.Red
console.log(newColor);

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
          .fontColor(Colors.Red)
      }
      .width('100%')
    }
    .height('100%')
  }
}

