import { listData } from "../data"

@Builder
export function ListerItem(item: listData) {
  Row() {
    Text(item.title)
    Text(item.address)
  }
  .ItemStyle()
}

@Extend(Row)
function ItemStyle() {
  .width('90%')
  .height(50)
  .background('#ccc')
  .padding(10)
  .borderRadius(10)
  .alignItems(VerticalAlign.Center)
  .justifyContent(FlexAlign.SpaceBetween)

}