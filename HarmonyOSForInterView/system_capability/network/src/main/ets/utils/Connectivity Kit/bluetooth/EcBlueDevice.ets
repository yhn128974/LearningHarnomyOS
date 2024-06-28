// import { Log } from '@abner/log';
// import { ble, constant } from '@kit.ConnectivityKit';
// import { promptAction } from '@kit.ArkUI';
// // import { BlueData, DoorLinkCallback, WIFI_CONNECT } from './Device';
// import { util } from '@kit.ArkTS';
// import { emitter } from '@kit.BasicServicesKit';
//
// interface ScanFilter {
//   type: 'mac' | 'name'
//   value: string
// }
//
// /**
//  *
//  * @param nodeId 10-8A-9B-8F-EC-3C
//  * @param deviceName JL-ITHEIMA-8A10(BLE)
//  * @returns
//  */
// export class EcBlueDevice {
//   // 扫描定时器 id
//   static timer: number
//   //  创建客户端
//   static clientDevice: ble.GattClientDevice | null = null
//   // 给蓝牙设备发送数据的特征服务的实例
//   static wrChar: ble.BLECharacteristic | null = null
//
//   // 是否与规定的数值匹配
//   static isMatchDoor(nodeId: string, deviceName: string) {
//     const adrs = nodeId.split('-')
//     const flag = adrs[1] + adrs[0]
//     return deviceName.includes(flag)
//   }
//
//   // 根据过滤条件返回蓝牙列表
//   static scanDevice(
//     // 解决扫描会一直执行,设置扫描过滤条件
//     scanFilter: ScanFilter,
//     callback: (list: ble.ScanResult[]) => void) {
//     if (EcBlueDevice.timer) {
//       // 清除定时器timer
//       clearTimeout(EcBlueDevice.timer)
//     } else {
//       // 蓝牙设备扫描列表
//       let list: ble.ScanResult[] = []
//
//       // 1. 订阅BLE 扫描设备发现的设备。
//       ble.on("BLEDeviceFind", (devices: ble.ScanResult[]) => {
//
//         // 打印扫到设备
//         devices.forEach(item => {
//           Log.warn(`扫描中...\n ${item.deviceName || '--'} ${item.deviceId}`)
//         })
//
//         list.push(...devices)
//
//         // 过滤条件
//         let valid = devices.filter(devItem => {
//           //支持按照mac地址精确搜索匹配=》匹配一个
//           if (scanFilter.type === 'mac') {
//             return list.some(item => item.deviceId !== devItem.deviceId)
//               // 是否与规定的mac字符串相等
//               && EcBlueDevice.isMatchDoor(scanFilter.value, devItem.deviceName)
//           }
//           //按照设备名称模糊匹配=》匹配多个
//           else {
//             return list.some(item => item.deviceId !== devItem.deviceId)
//               // 设备的名字是否是scanFilter.value开头
//               && devItem.deviceName.startsWith(scanFilter.value)
//           }
//         })
//
//
//         // 精确匹配到后直接结束扫描
//         if (valid.length > 0) {
//           list.push(...valid)
//           if (scanFilter.type === 'mac') {
//             callback(list)
//             clearTimeout(EcBlueDevice.timer)
//             ble.off('BLEDeviceFind')
//             ble.stopBLEScan()
//           }
//         }
//       });
//
//       // 3.设置扫描参数
//       let scanOptions: ble.ScanOptions = {
//         interval: 500,
//         dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
//         matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
//       }
//
//       //  2. 开启扫描
//       ble.startBLEScan(null, scanOptions);
//
//       EcBlueDevice.timer = setTimeout(() => {
//         callback(list)
//         // 取消订阅BLE设备发现。
//         ble.off('BLEDeviceFind')
//         // 停止BLE扫描流程。
//         ble.stopBLEScan()
//       }, 10000)
//     }
//
//   }
//
//   /**
//    * 连接门禁
//    * @param deviceId
//    * @param callback
//    */
//   static connectDoorDevice(deviceId: string, callback: DoorLinkCallback) {
//
//     EcBlueDevice.destroy()
//     // 创建客户端
//     EcBlueDevice.clientDevice = ble.createGattClientDevice(deviceId)
//     // 1. 连接设备
//     EcBlueDevice.clientDevice.connect()
//     // 监听链接状态
//     EcBlueDevice.clientDevice.on('BLEConnectionStateChange', async (res) => {
//       if (res.state === constant.ProfileConnectionState.STATE_CONNECTED) {
//         // 告诉页面连接成功
//         callback()
//         // 2. 发现服务
//         try {
//           //获取server的services信息
//           const res = await EcBlueDevice.clientDevice?.getServices()
//
//           // 查找自定义读写服务
//           const ser = res?.find(item => item.serviceUuid.startsWith('0000AE30'))
//
//           if (ser) {
//             Log.info(ser)
//             // 1. 读写特征值 => app 给蓝牙设备发送数据
//             EcBlueDevice.wrChar = ser.characteristics.find(item => item.characteristicUuid.startsWith('0000AE10'))!
//
//             // 2. 通知特征值=> 设备给手机发送数据
//             const ntChar = ser.characteristics.find(item => item.characteristicUuid.startsWith('0000AE04'))
//
//             // 监听特征值变化，设备通信
//             const td = util.TextDecoder.create()
//             EcBlueDevice.clientDevice?.on('BLECharacteristicChange', (res) => {
//
//               const buff = new Uint8Array(res.characteristicValue)
//
//               const result = JSON.parse(td.decodeWithStream(buff)) as BlueData
//
//               if (result.command === 'wifi') {
//                 emitter.emit(WIFI_CONNECT, {
//                   data: {
//                     status: result.status
//                   }
//                 })
//               }
//             })
//
//             // 向服务端发送设置通知此特征值请求
//             await EcBlueDevice.clientDevice?.setCharacteristicChangeNotification(ntChar, true)
//           } else {
//             promptAction.showToast({ message: '未找到服务' })
//           }
//           // client协商远端蓝牙低功耗设备的最大传输单元
//           EcBlueDevice.clientDevice?.setBLEMtuSize(300)
//         } catch (e) {
//           Log.error('门禁设备报错：' + JSON.stringify(e))
//         }
//       }
//     })
//   }
//
//   static destroy() {
//     if (EcBlueDevice.clientDevice) {
//       try {
//         EcBlueDevice.clientDevice.disconnect()
//       } catch (e) {
//         Log.error('设备断开报错：' + JSON.stringify(e))
//       }
//       EcBlueDevice.clientDevice.close()
//       EcBlueDevice.clientDevice = null
//     }
//   }
//
//   static async sendWifiData(prams: BlueData) {
//
//     try {
//       // 将数据转换为二进制码
//       const encoder = new util.TextEncoder();
//       const uint8Array = encoder.encodeInto(JSON.stringify(prams));
//       //发送数据给设备
//       await EcBlueDevice.clientDevice?.writeCharacteristicValue({
//         serviceUuid: EcBlueDevice.wrChar!.serviceUuid,
//         characteristicUuid: EcBlueDevice.wrChar!.characteristicUuid,
//         characteristicValue: uint8Array.buffer,
//         descriptors: []
//       }, ble.GattWriteType.WRITE)
//       promptAction.showToast({ message: '发送账号成功' })
//       return true
//       // ...
//     } catch (e) {
//       Log.error(e)
//       return false
//
//     }
//
//   }
// }
