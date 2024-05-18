import { geoLocationManager } from '@kit.LocationKit';

@Entry
@Component
struct HuaweiMapDemo {
  @State
  result:geoLocationManager.Location  = {} as geoLocationManager.Location
  build() {
    Column() {
      Button('获取经纬度')
        .onClick(async ()=>{
          this.result = await geoLocationManager.getCurrentLocation()
        })
      Text('经度：'+this.result.latitude)
      Text('纬度：'+this.result.longitude)
    }.height('100%')
  }
}