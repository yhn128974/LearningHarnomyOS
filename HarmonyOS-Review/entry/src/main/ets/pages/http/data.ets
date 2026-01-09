export interface school {
  founding: string
  area: string
  affiliate: string
  encode: string
  address: string
  discipline: string
  laboratory: string
  doctor: string
  master: string
  intro: string
  detail: string
}

@ObservedV2
class schoolModel implements school {
  @Trace
  founding: string
  @Trace
  area: string
  @Trace
  affiliate: string
  @Trace
  encode: string
  @Trace
  address: string
  @Trace
  discipline: string
  @Trace
  laboratory: string
  @Trace
  doctor: string
  @Trace
  master: string
  @Trace
  intro: string
  @Trace
  detail: string

  constructor(school: school) {
    this.founding = school.founding
    this.area = school.area
    this.affiliate = school.affiliate
    this.encode = school.encode
    this.discipline = school.discipline
    this.laboratory = school.laboratory
    this.doctor = school.doctor
    this.master = school.master
    this.intro = school.intro
    this.detail = school.detail
    this.address = school.address

  }
}

export interface dataResult {
  code: number,
  msg: string,
  data: school
}

@ObservedV2
class dataResultModel implements dataResult {
  @Trace
  code: number
  @Trace
  msg: string
  @Trace
  data: school

  constructor(dataResult: dataResult) {
    this.code = dataResult.code
    this.msg = dataResult.msg
    this.data = dataResult.data

  }
}