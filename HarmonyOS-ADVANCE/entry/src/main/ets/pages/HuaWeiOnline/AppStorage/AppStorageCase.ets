@Component
struct LinkLinkChild {
  @StorageLink("testNum") @Watch("testNumChange") newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({} as TESTNUMBER)

  testNumChange(propName: string): void {
    console.log(`LinkLinkChild: testNum value ${this.newdata.testNumber}`);
  }

  build() {
    Text(`LinkLinkChild: ${this.newdata.testNumber}`)
  }
}

@Component
struct PropLinkChild {
  @StorageProp("testNum") @Watch("testNumChange") newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({} as TESTNUMBER)

  testNumChange(propName: string): void {
    console.log(`PropLinkChild: testNumGrand value ${this.newdata.testNumber}`);
  }

  build() {
    Text(`PropLinkChild: ${this.newdata.testNumber}`)
      .height(70)
      .backgroundColor(Color.Red)
      .onClick(() => {
        this.newdata.testNumber += 1;
      })
  }
}

@Component
struct Sibling {
  @StorageLink("testNum") @Watch("testNumChange") newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({} as TESTNUMBER)

  testNumChange(propName: string): void {
    console.log(`Sibling: testNumChange value ${this.newdata.testNumber}`);
  }

  build() {
    Text(`Sibling: ${this.newdata.testNumber}`)
  }
}

@Component
struct LinkChild {
  @StorageLink("testNum") @Watch("testNumChange") newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({} as TESTNUMBER)

  testNumChange(propName: string): void {
    console.log(`LinkChild: testNumChange value ${this.newdata.testNumber}`);
  }

  build() {
    Column() {
      Button('incr testNum')
        .onClick(() => {
          console.log(`LinkChild: before value change value $ this.newdata.testNumber}`);
          this.newdata.testNumber = this.newdata.testNumber + 1
          console.log(`LinkChild: after value change value ${this.newdata.testNumber}`);
        })
      Text(`LinkChild: ${this.newdata.testNumber}`)
      LinkLinkChild({
        /* empty */
      })
      PropLinkChild({
        /* empty */
      })
    }
    .height(200).width(200)
  }
}


interface TESTNUMBER {
  testNumber: number
}

class TESTNUMBERMODELS implements TESTNUMBER {
  testNumber = 0

  constructor(NEWTESTNUMBER: TESTNUMBER) {
    this.testNumber = NEWTESTNUMBER.testNumber
  }
}

@Entry
@Component
struct Parent {
  @StorageLink("testNum") @Watch("testNumChange1") newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({} as TESTNUMBER)

  aboutToAppear(): void {
    let newdata: TESTNUMBERMODELS = new TESTNUMBERMODELS({
      testNumber: 100
    })
    AppStorage.setOrCreate('testNum', newdata)

  }

  testNumChange1(propName: string): void {
    console.log(`Parent: testNumChange value ${this.newdata.testNumber}`)
  }

  build() {
    Column() {
      LinkChild({
        /* empty */
      })
      Sibling({
        /* empty */
      })
    }
  }
}