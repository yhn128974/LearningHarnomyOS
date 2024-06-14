import { common } from '@kit.AbilityKit'
import { ListFileOptions } from '@kit.CoreFileKit'
import fs from '@ohos.file.fs'

let context = getContext(this) as common.UIAbilityContext
let filesDir = context.filesDir



function getFileList() {
  let listFileOption: ListFileOptions = {
    recursion: false, // Whether to recursively list files.
    listNum: 0, //The number of files listed.
    filter: {
      suffix: ['.png', '.jpg', '.text','.txt'],
      displayName: ['test'], //文件的mime类型。
      fileSizeOver: 0,
      lastModifiedAfter: new Date(0).getTime()
    }
  }
  let filesList = fs.listFileSync(filesDir, listFileOption);
  for (let index = 0; index < filesList.length; index++) {
    console.info("The name of file:",`${filesList[index]}`)
  }
}

@Entry
@Component
export struct GetFileList {
  aboutToAppear(): void {
    getFileList()
  }
  build() {

  }
}