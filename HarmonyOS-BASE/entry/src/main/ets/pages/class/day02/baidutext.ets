@Entry
@Component
struct Index {
  build() {
    Column() {
      Image($r('app.media.story'))
        .width(120)
      Text('帝师县令')
        .lineHeight(60)
        .fontSize(30)
        .fontColor('#1d1c21')
        .fontWeight(600)
      Text('202万字')
        .lineHeight(24)
        .fontSize(14)
        .fontColor('#777')
      Text('兵荒马乱的世道，赵康一朝穿越成乾国九品县令。胸无大志的他并不想争霸天下，只想当个混吃等死，为非作歹的土皇帝。于是，在元江县出现了许多奇奇怪怪的东西，老八洗浴城、二狗麻将馆、张三养生店.....直到有一天女帝微服私访 元江县.....')
        .lineHeight(30)
        .fontSize(18)
        .textIndent(36)
        .maxLines(4)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .fontColor('#777')
    }
  }
}