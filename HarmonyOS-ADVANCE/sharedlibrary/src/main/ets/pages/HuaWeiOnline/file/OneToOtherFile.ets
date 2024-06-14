// pages/xxx.ets
import fs, { ReadOptions } from '@ohos.file.fs';
import common from '@ohos.app.ability.common';

// 获取应用文件路径
let context = getContext(this) as common.UIAbilityContext;
let filesDir = context.filesDir;

async function readWriteFileWithStream(): Promise<void> {
  // 打开文件流
  let inputStream = fs.createStreamSync(filesDir + '/test.txt', 'r+');
  let outputStream = fs.createStreamSync(filesDir + '/destFile.txt', "w+");

  // 以流的形式读取源文件内容并写入目的文件
  let bufSize = 4096;
  let readSize = 0;
  let buf = new ArrayBuffer(bufSize);

  let readOptions: ReadOptions = {
    offset: readSize,
    length: bufSize
  };

  let readLen = await inputStream.read(buf, readOptions);
  readSize += readLen;

  while (readLen > 0) {
    await outputStream.write(buf);
    readOptions.offset = readSize;
    readLen = await inputStream.read(buf, readOptions);
    readSize += readLen;
  }

  // 关闭文件流
  inputStream.closeSync();
  outputStream.closeSync();

}
@Entry
@Component
export struct OneToOtherFile {
  @State message: string = 'Hello World';
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

