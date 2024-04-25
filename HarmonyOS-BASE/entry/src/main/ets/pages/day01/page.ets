


@Component
struct ListItemComponent1{
  build() {
    Text('thia is title')
  }
}




@Entry
@Component
struct ListItemComponent{
  build() {
    Column(){
      ListItemComponent1()
      Text('hello world',)
    }
  }
}