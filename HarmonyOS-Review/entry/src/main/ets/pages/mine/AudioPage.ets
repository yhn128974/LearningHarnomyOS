import { HcNavBar } from "../../commons/components"
import { abilityAccessCtrl, Permissions } from "@kit.AbilityKit"
import { permission } from "../../models/permission"
import { promptAction } from "@kit.ArkUI"
import { logger, navPathStack } from "../../commons/utils"
import { fileIo, fileIo as fs } from '@kit.CoreFileKit';
import { media } from "@kit.MediaKit"
import { AudioBoComp } from "./comps/AudioBoComp"

@ComponentV2
struct AudioPage {
  permissions: Permissions[] = ['ohos.permission.MICROPHONE']
  confirmConfig: promptAction.ShowDialogOptions = {
    title: "温馨提示",
    message: "未授权使用麦克风将无法使用该面试录音功能，是否前往设置进行授权？",
    buttons: [
      { text: '离开', color: $r('app.color.common_gray_01') },
      { text: '去授权', color: $r('app.color.black') }
    ]
  }
  filePath: string = '' //文件路径
  fileFd: number = 0 //文件ID
  avRecorder?: media.AVRecorder
  //音频振幅
  @Local maxAmplitude: number = 0
  //定时器ID
  intervalId: number = 0
  //
  total: number = 0
  //
  value: number = 0;
  //当前的播放器
  avPlayer?: media.AVPlayer

  aboutToAppear(): void {
    this.requestPermission()
  }

  async requestPermission() {
    // 1. 用户授权
    const flag: boolean = await permission.requestPermissions(this.permissions)
    if (flag) {
      return
    }
    // 2. 二次授权
    else {
      try {
        const confirm = await promptAction.showDialog(this.confirmConfig)
        if (confirm.index === 1) {
          const isOk2 = await permission.openPermissionSetting(this.permissions)
          if (isOk2) {
            return
          }
        }
        //
        navPathStack.pop()
      } catch (e) {
        promptAction.showToast({ message: '未授权' })
        navPathStack.pop()
      }
    }
  }

  async startRecord() {
    //准备一个文件接受录音

    const context: Context = getContext(this); // 参考应用文件访问与管理
    let filePath: string = context.filesDir + Date.now() + '.M4A';
    let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fileFd: number = audioFile.fd; // 获取文件f
    //
    this.filePath = filePath
    this.fileFd = fileFd

    //二.开始录制
    //1.配置参数
    let avProfile: media.AVRecorderProfile = {
      audioBitrate: 100000, // 音频比特率
      audioChannels: 2, // 音频声道数
      audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式，当前支持ACC，MP3，G711MU
      audioSampleRate: 48000, // 音频采样率
      fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // 封装格式，当前支持MP4，M4A，MP3，WAV
    };
    let avConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, // 音频输入源，这里设置为麦克风
      profile: avProfile,
      url: 'fd://' + fileFd.toString(), // 参考应用文件访问与管理中的开发示例获取创建的音频文件fd填入此处
    };

    //2.创建对象
    const avRecorder = await media.createAVRecorder()
    //
    await avRecorder.prepare(avConfig)
    await avRecorder.start()

    this.intervalId = setInterval(async () => {
      this.maxAmplitude = await avRecorder.getAudioCapturerMaxAmplitude()
    }, 100)
    this.avRecorder = avRecorder
  }

  async stopRecord() {
    if (this.avRecorder) {
      await this.avRecorder?.stop()
      await this.avRecorder.release()
      //关闭文件
      fs.close(this.fileFd)
      //
      clearInterval(this.intervalId)
    }

  }

  async startPlay() {
    try {
      const file = fileIo.openSync(this.filePath, fileIo.OpenMode.READ_ONLY)
      const avPlayer = await media.createAVPlayer()

      avPlayer.on('stateChange', state => {
        if (state === 'initialized') {
          avPlayer.prepare()
        } else if (state === 'prepared') {
          avPlayer.loop = true
          this.total = avPlayer.duration
          avPlayer.play()
        }
      })
      // 监听当前播放进度
      avPlayer.on('timeUpdate', (time) => {
        this.value = time
      })
      avPlayer.url = `fd://${file.fd}`
      this.avPlayer = avPlayer
    } catch (e) {
      logger.error('startPlay', JSON.stringify(e))
    }
  }

  stopPlay() {
    if (this.avPlayer) {
      this.avPlayer.stop()
      this.avPlayer.release()
    }
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      HcNavBar({ title: '录音功能' })

      Row() {
        Button('start record').onClick(() => {
          this.startRecord()
        })
        Button('stop record').onClick(() => {
          this.stopRecord()
        })
      }

      AudioBoComp({
        maxAmplitude: this.maxAmplitude
      })

      Row() {
        //
        Button('start play').onClick(() => {
          this.startPlay()
        })
        //
        Button('stop play').onClick(() => {
          this.stopPlay()
        })
      }

      Progress({
        total: this.total, value: this.value
      }).width('80%')

    }
    .hideTitleBar(true)
  }
}

// 跳转页面入口函数
@Builder
export function AudioBuilder() {
  AudioPage()
}