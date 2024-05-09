// pages/xxx.ets
import fs, { ListFileOptions, ReadOptions } from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import buffer from '@ohos.buffer';

// 获取应用文件路径
// 通过AbilityStageContext、UIAbilityContext、ExtensionContext获取HAP级别的应用文件路径。
// 此路径是HAP相关信息推荐的存放路径，这些文件会跟随HAP的卸载而删除，但不会影响应用级别路径的文件，除非该应用的HAP已全部卸载。
let context = getContext(this) as common.UIAbilityContext
let filesDir = context.filesDir;


function createFile(): void {
  // 新建并打开文件
  let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  // 写入一段内容至文件
  let writeLen = fs.writeSync(file.fd, "Try to write str.");
  console.info("The length of str is: " + writeLen);
  // 从文件读取一段内容
  let arrayBuffer = new ArrayBuffer(1024);
  let readOptions: ReadOptions = {
    offset: 0,
    length: arrayBuffer.byteLength
  };
  let readLen = fs.readSync(file.fd, arrayBuffer, readOptions);
  let buf = buffer.from(arrayBuffer, 0, readLen);
  console.info("the content of file: " + buf.toString());
  // 关闭文件
  fs.closeSync(file);
}

function readWriteFile(): void {
  // 打开文件
  let srcFile = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let destFile = fs.openSync(filesDir + '/destFile.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  // 读取源文件内容并写入至目的文件
  let bufSize = 4096;
  let readSize = 0;
  let buf = new ArrayBuffer(bufSize);
  let readOptions: ReadOptions = {
    offset: readSize,
    length: bufSize
  };
  let readLen = fs.readSync(srcFile.fd, buf, readOptions);
  while (readLen > 0) {
    readSize += readLen;

    fs.writeSync(destFile.fd, buf, {
      length: readLen
    });
    readOptions.offset = readSize;
    readLen = fs.readSync(srcFile.fd, buf, readOptions);
  }
  // 关闭文件
  fs.closeSync(srcFile);
  fs.closeSync(destFile);
}


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

// 查看文件列表
function getListFile(): void {
  let listFileOption: ListFileOptions = {
    recursion: false,
    listNum: 0,
    filter: {
      suffix: [".png", ".jpg", ".txt"],
      displayName: ["test*"],
      fileSizeOver: 0,
      lastModifiedAfter: new Date(0).getTime()
    }
  };
  let files = fs.listFileSync(filesDir, listFileOption);
  for (let i = 0; i < files.length; i++) {
    console.info(`The name of file: ${files[i]}`);
  }
}