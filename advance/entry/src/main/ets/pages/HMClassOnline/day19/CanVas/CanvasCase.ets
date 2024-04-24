import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  myPen: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  @State CanVasWidth: number = 0;
  @State CanVasHeight: number = 0;

  deawHook() {
    this.myPen.beginPath()
    this.myPen.lineWidth = 3
    this.myPen.strokeStyle = 'green'
    this.myPen.moveTo(20, 180)
    this.myPen.lineTo(180, 300)
    this.myPen.moveTo(180, 300)
    this.myPen.lineTo(340, 20)
    this.myPen.stroke()
    this.myPen.closePath()
  }

  drawCircle() {
    this.myPen.beginPath()
    this.myPen.lineWidth = 3
    this.myPen.strokeStyle = 'green'
    this.myPen.arcTo(0, 180, 360, 180, 180)
    this.myPen.stroke()
    this.myPen.closePath()
  }

  clear() {
    this.myPen.clearRect(0, 0, this.CanVasWidth, this.CanVasHeight)
  }

  build() {
    Column() {
      Canvas(this.myPen)
        .width('100%')
        .aspectRatio(1)
        .backgroundColor(Color.Gray)
        .onReady(() => {
          this.myPen.lineWidth = 2
          this.myPen.strokeStyle = 'red'

        })
        .onTouch((event) => {
          if (event.type === TouchType.Down) {
            // 开始绘画
            this.myPen.beginPath()
            this.myPen.moveTo(event.touches[0].x, event.touches[0].y)
          }
          if (event.type === TouchType.Move) {
            this.myPen.lineTo(event.touches[0].x, event.touches[0].y)
            this.myPen.stroke()
          }
          if (event.type === TouchType.Up) {
            this.myPen.closePath()
          }
        })
        .onAreaChange((oldArea, newArea) => {
          this.CanVasWidth = newArea.width as number
          this.CanVasHeight = newArea.height as number
        })

      Row() {
        Button('化√').onClick(() => {
          this.deawHook()
        })
        Button('画弧长').onClick(() => {
          this.drawCircle()
        })
        Button('clear').onClick(() => {
          this.clear()
        })
      }
    }.width('100%').height('100%')
  }
}

