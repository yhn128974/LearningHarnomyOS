import { Peron, PersonModel } from '../model/user';
import { AppStorageV2, PersistenceV2 } from '@kit.ArkUI';

@Entry
@ComponentV2
struct HomePage {
  @Local message: string = 'Hello World';
  @Local user: PersonModel = AppStorageV2.connect(PersonModel, 'Alice', () => new PersonModel({
    name: "游客",
    age: 0
  } as Peron))!
  @Local localUser: PersonModel = PersistenceV2.connect(PersonModel, 'Ben', () => new PersonModel({
    name: "default",
    age: 0
  }))!

  build() {
    RelativeContainer() {
      Column() {
        Text(this.user.name)
        Text(this.user.age.toString())
        Row() {
          Text('THE INFO CONME FROM THE INFO PAGE ')
        }

        Row({
          space: 10
        }) {
          Text(this.localUser.name)
          Text(this.localUser.age.toString())
        }.border({
          width: 1
        })
      }

    }
    .height('100%')
    .width('100%')
  }
}