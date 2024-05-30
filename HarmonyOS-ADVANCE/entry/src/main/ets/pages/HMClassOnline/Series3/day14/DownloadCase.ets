import { request } from '@kit.BasicServicesKit';

@Entry
@Component
struct DownloadCase {
  @State downloadUrl: string = 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png';
  @State filePath:string = ''
  build() {
    Row() {
      Column({ space: 20 }) {
        Image(this.downloadUrl)
          .width(200)
        Button('下载')
          .onClick(async () => {
            let currentFilePath = getContext().cacheDir + '/test.jpg'
            const task = await request.downloadFile(getContext(), {
              url: this.downloadUrl,
              filePath:currentFilePath
            })
            task.on('complete', () => {
              this.filePath = currentFilePath
              AlertDialog.show({
                message: '下载成功'
              })
            })
          })
        if(this.filePath){
          Image('file://'+this.filePath)
            .width(200)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}