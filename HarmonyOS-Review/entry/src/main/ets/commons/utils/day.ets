const day = 60 * 60 * 24
const hour = 60 * 60
const min = 60

export const formatTime = (second: number = 0) => {
  if (second > day) {
    return (second / day).toFixed(1) + '天'
  } else if (second > hour) {
    return (second / hour).toFixed(1) + '小时'
  } else {
    return (second / min).toFixed(0) + '分钟'
  }
}