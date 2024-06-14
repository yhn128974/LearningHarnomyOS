import { common } from '@kit.AbilityKit';
import fs, { ReadOptions } from '@ohos.file.fs'
import { buffer } from '@kit.ArkTS';

let context = getContext(this) as common.UIAbilityContext;
let fileDir = context.filesDir

function createFile() {
  let file = fs.openSync(fileDir + "/test.txt", fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
  // fs.writeSync 同步方法向指定路径写入文件内容 返回该内容的字符串长度
  let writeLen = fs.writeSync(file.fd, 'hi this is my first letter to you please do not forget me !')
  console.info("the length of str is :" + writeLen)

  //   缓存大学
  let arrayBuffer = new ArrayBuffer(1024)
  // 读取选项
  let readOptions: ReadOptions = {
    offset: 0,
    length: arrayBuffer.byteLength
  }
  // 读取文件
  let readLen = fs.readSync(file.fd, arrayBuffer, readOptions);
  //
  let buf = buffer.from(arrayBuffer, 0, readLen);

  console.info("the content of file: " + buf.toString());
  fs.closeSync(file)
}


@Entry
@Component
export struct CreateFileCase {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    createFile()
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

