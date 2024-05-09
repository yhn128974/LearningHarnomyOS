import {FoodItem} from '../models'
PersistentStorage.persistProp("user_cart",[])

export class CartStore{
  static getCarts(){
   return AppStorage.get<FoodItem[]>('user_cart')||[] as FoodItem[]
  }
  static clearCarts(){
    AppStorage.set('user_cart',[])

  }
}


