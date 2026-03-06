//媒体查询
// 1. 导入 模块
import {mediaquery} from '@kit.ArkUI'

// 2. 创建监听器
const listenerXS=mediaquery.matchMediaSync('(0vp<=width<320vp)')
const listenerSM=mediaquery.matchMediaSync('(320vp<=width<600vp)')
const listenerMD=mediaquery.matchMediaSync('(600vp<=width<840vp)')
const listenerLG=mediaquery.matchMediaSync('(840vp<=width)')
//3.
const listenerDark=mediaquery.matchMediaSync('(dark-mode:true)')




@Component
export  struct mediaCheck {
  //
  @State currentBreakPoint:string='sm'
  @State baColor:Color=Color.White
  @State message:string=""
  // 3. 注册监听器
  aboutToAppear(): void
  {
    listenerDark.on('change',(res:mediaquery.MediaQueryResult)=>{
      if (res.matches) {
        // this.baColor=Color.Black
        this.message ='深色模式'
        console.log('深色模式',JSON.stringify(res))
      }else {
        this.message ='亮色模式'
      }
    })

    listenerXS.on('change',(res:mediaquery.MediaQueryResult)=>{
      if (res.matches) {
        this.currentBreakPoint='xs'
      }
    })

    listenerSM.on('change',(res:mediaquery.MediaQueryResult)=>{
      if (res.matches) {
        this.currentBreakPoint='sm'
      }
    })

    listenerMD.on('change',(res:mediaquery.MediaQueryResult)=>{
      if (res.matches) {
        this.currentBreakPoint='md'
      }
    })

    listenerLG.on('change',(res:mediaquery.MediaQueryResult)=>{
      if (res.matches) {
        this.currentBreakPoint='lg'
      }
    })
  }
  // 4. 移除监听器
  aboutToDisappear(): void {
    listenerDark.off('change')
    listenerXS.off('change')
    listenerSM.off('change')
    listenerMD.off('change')
    listenerLG.off('change')
  }
  // @StorageProp('currentBreakpoint') curBp: string = 'sm'

  build() {
Column(){
  Text(this.currentBreakPoint)
  Text(this.message)
}
  }
}