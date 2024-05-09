@Entry
@Component
struct PromiseCase {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    this.handlePromise()
  }

  handlePromise() {


    const p2 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        reject('error')
      }, 300)
    })

    const p1 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('success')
      }, 100)
    })
    const p3 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        reject('error')
      }, 200)
    })

    // Promise.race() 静态方法接受一个 promise 可迭代对象作为输入，
    // 并返回一个 Promise。
    // 这个返回的 promise 会随着第一个 promise 的敲定而敲定。
    Promise.race([p1, p2, p3]).then(res => {
      console.log('res', res)
    }).catch((err: string) => {
      console.log('err', err)
    })


    const k2 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('success k2')
      }, 300)
    })

    const k1 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('success k1')
      }, 100)
    })
    const k3 = new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('success k3')
      }, 200)
    })




    // Promise.all() 静态方法接受一个 Promise 可迭代对象作为输入，
    // 并返回一个 Promise。当所有输入的 Promise 都被兑现时，
    // 返回的 Promise 也将被兑现（即使传入的是一个空的可迭代对象），
    // 并返回一个包含所有兑现值的数组。如果输入的任何 Promise 被拒绝，
    // 则返回的 Promise 将被拒绝，并带有第一个被拒绝的原因。
    Promise.all([k1, k2, k3]).then(res => {
      console.log('res', res)
    }).catch((err: string) => {
      console.log('err', err)
    })


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

