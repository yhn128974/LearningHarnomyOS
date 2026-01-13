import { User } from './model'
import { My } from './NavDestination/My'
import { MyList } from './NavDestination/MyList'
import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct MianNavigationPage {
  @Local Alice: User = {
    name: "Alice",
    age: 20
  }
  //创建路由站点
  @Provider() navPathStack: NavPathStack = new NavPathStack()

  // navPathStack: NavPathStack = new NavPathStack()

  @Builder
  pagesBuilder(name: string) {
    if (name == 'my') {
      //加载我的子页面,注意子页面的内容必须用navDestination包裹
      My()
    }
    if (name == 'list') {
      MyList()
    }
  }

  @Builder
  navigationBuidler() {
    Row() {
      Image($r('sys.media.AI_search')).width(30)
      Text('mian page')
    }

  }

  aboutToAppear(): void {
    //添加路由拦截
    this.navPathStack.setInterception({
      willShow: (from, to) => {
        console.log(JSON.stringify(from))

        //判断是不是起始页
        if (typeof to === 'string') {
          console.log('home page')
          return
        }

        let target: NavDestinationContext = to as NavDestinationContext

        if (target.pathInfo.name == 'my') {
          //判断跳转的授权，如果没有token需要拦截跳转
          target.pathStack.pop() //移除主页

          target.pathStack.pushPathByName('list', null) //到list页面
        }
      },
      didShow: () => {

      }
    })
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Text('I am main page')
        Button('go to my page').onClick(() => {

          // this.navPathStack.pushPath({
          //   name: "my",
          //   param: this.Alice
          // })

          this.navPathStack.pushPathByName('my', this.Alice, (value) => {
            promptAction.openToast({
              message: JSON.stringify(value)
            })
            //value.result拿到返回的结果
            console.log(JSON.stringify(value.result))
          })

        })
      }
    }
    //Navigation模式,Auto:+600之和开始分栏
    .mode(NavigationMode.Auto)
    .title(this.navigationBuidler)

    //在配置页面栈的出口后来所有的页面都会走这个Builder的逻辑
    //需要在这个builder逻辑中进行判断，不用的name解析不同的结构
    //如果没有在这里使用builder，这需要使用配置路由表的方式完成页面栈的出口设置
    // .navDestination(this.pagesBuilder)

  }
}

