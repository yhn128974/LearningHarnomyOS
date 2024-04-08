@Preview
@Component
export struct ZhiFuHeader {
  build() {
Row(){
  Row(){
    Image('/assets/return.svg').width(20)
  }.borderRadius(15).width(30).height(30).backgroundColor('#ddd').justifyContent(FlexAlign.Center)
  Row(){
    Text('评论回复')
  }
  .layoutWeight(1).justifyContent(FlexAlign.Center)
}.justifyContent(FlexAlign.SpaceBetween).padding(10)
  }
}