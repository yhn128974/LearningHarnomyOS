import { promptAction } from '@kit.ArkUI';

interface Car {
  price: number;
  brand: string;

}

@ObservedV2
class CarModel implements Car {
  @Trace
  price: number;
  @Trace
  brand: string;

  constructor(car: Car) {
    this.price = car.price;
    this.brand = car.brand
  }
}

@Entry
@ComponentV2
struct ProviderConsumerPage {
  @Provider() message: string = 'Hello World';
  @Provider() currentCar: CarModel = new CarModel({ price: 20000, brand: "xiaomiShu7" })
  @Provider() showMessage: (message: string) => void = (message: string) => {
    promptAction.openToast({
      message: message
    }
    )
  }

  build() {
    Column() {
      child()
      Button('çhange mesasge').onClick((event: ClickEvent) => {
        this.message = 'hello typescript'
      })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct child {
  build() {
    grandson()
  }
}

@ComponentV2
struct grandson {
  @Local currentMessage: string = ''
  @Consumer() message: string = ''
  @Consumer() currentCar: CarModel = new CarModel({} as Car)
  @Consumer() showMessage: (message: string) => void = () => {
  }

  build() {
    Column() {
      Text(this.message)
      Text(`${this.currentCar.brand}__${this.currentCar.price}`)
      Button('change car price').onClick((event: ClickEvent) => {
        this.currentCar.price += 100
      })


      TextInput({
        text: this.currentMessage!!
      }).onSubmit(() => {
        this.showMessage(this.currentMessage)
      })


    }
  }
}