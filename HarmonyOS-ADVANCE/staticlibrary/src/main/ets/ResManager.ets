// library/src/main/ets/ResManager.ets
export class ResManager {
  static getImg(): Resource {
    return $r('app.media.img');
  }

  static getDesc(): Resource {
    return $r('app.string.shared_desc');
  }
}