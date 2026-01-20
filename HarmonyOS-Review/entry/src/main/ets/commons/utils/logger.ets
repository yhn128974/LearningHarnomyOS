import { hilog } from '@kit.PerformanceAnalysisKit';

const LOGGER_PREFIX: string = 'interview_logger';

class Logger {
  //业务领域:MAC地址
  private domain: number;
  //日志标识:应用名
  private prefix: string;
  //打印格式:
  private format: string = '%{public}s, %{public}s';

  constructor(prefix: string = '', domain: number = 0x0000) {
    this.prefix = prefix;
    this.domain = domain;
  }

  debug(...args: string[]): void {

    hilog.debug(this.domain, this.prefix, this.format, args);
  }

  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, args);
  }

  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }

  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}

export const logger = new Logger(LOGGER_PREFIX, 0x1234);