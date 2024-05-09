import axios, { AxiosResponse } from '@ohos/axios';
import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';


export interface BOOKMessage {
  /**
   * 响应数组
   */
  data: Book[];

  /**
   * 响应消息
   */
  message: string;

}

export interface Book {
  /**
   * 图书作者
   */
  author: string;

  /**
   * 图书名字
   */
  bookname: string;

  /**
   * 图书id
   */
  id: number;

  /**
   * 图书出版社
   */
  publisher: string;

}


export interface DeleteModelMessage {
  /**
   * 响应结果
   */
  data: DeleteModelData;

  /**
   * 响应消息
   */
  message: string;
}

export interface DeleteModelData {
  /**
   * 删除的图书id
   */
  id: string;
}

export interface putModel {
  /**
   * 图书作者
   */
  author: string;

  /**
   * 图书名字
   */
  bookname: string;

  /**
   * 图书创建者，写上自己名字-管理自己的数据
   */
  creator: string;

  /**
   * 图书出版社
   */
  publisher: string;
}

@Entry
@Component
struct Index {
  @State bookList: Book[] = []
  @State creator: string = '老李'
  @State bookname: string = ''
  @State author: string = ''
  @State publisher: string = ''
  @State isShowDetail: boolean = false;

  aboutToAppear(): void {
    this.getBooks()
  }

  AXIOSBASE() {
    return axios.create({
      baseURL: 'https://hmajax.itheima.net/api/books'
    })
  }

  async getBooks() {
    let axiosReq = this.AXIOSBASE()
    let res: AxiosResponse<BOOKMessage> = await axiosReq<BOOKMessage, AxiosResponse<BOOKMessage>, null>({
      method: http.RequestMethod.GET,
      params: {
        creator: this.creator
      }
    })
    this.bookList = res.data.data
  }

  async postBook() {
    let axiosReq = this.AXIOSBASE()
    let data: putModel = {
      bookname: this.bookname,
      author: this.author,
      publisher: this.publisher,
      creator: this.creator
    }
    let res: AxiosResponse<BOOKMessage> = await axiosReq<BOOKMessage, AxiosResponse<BOOKMessage>, putModel>({
      method: http.RequestMethod.POST,
      data: data
    })


    console.log(res.data.message)

    this.bookList = res.data.data


  }

  async delectBook(id: number) {
    let axiosReq = this.AXIOSBASE()
    let res: AxiosResponse<DeleteModelMessage> = await axiosReq<DeleteModelMessage, AxiosResponse<DeleteModelMessage>, putModel>({
      method: http.RequestMethod.DELETE,
      url: id.toString(),
    })
    console.log(res.data.message)
    let index = this.bookList.findIndex(item => item.id === id)
    if (index > -1) {
      this.bookList.splice(index, 1)
    }


  }

  async putBook(id: string) {
    let axiosReq = this.AXIOSBASE()
    let data: putModel = {
      bookname: this.bookname,
      author: this.author,
      publisher: this.publisher,
      creator: this.creator
    }

    let res: AxiosResponse<BOOKMessage> = await axiosReq<BOOKMessage, AxiosResponse<BOOKMessage>, putModel>({
      url: `${id}`,
      method: http.RequestMethod.PUT,
      data: data
    })

    console.log(res.data.message)

    this.bookList = res.data.data
  }

  build() {
    Column() {
      Column({
        space: 5
      }) {
        Text("当前管理员：" + this.creator)
        TextInput({
          placeholder: '图书名',
          text: $$this.bookname
        })
        TextInput({
          placeholder: '作者',
          text: $$this.author
        })
        TextInput({
          placeholder: '出版社',
          text: $$this.publisher
        })
        Button('点击提交').onClick((event: ClickEvent) => {
          this.postBook()
        }).width('100%').enabled(this.bookname !== "" && this.author !== "" && this.publisher !== "")
      }.padding(20)

      List({
        space: 5
      }) {
        ForEach(this.bookList, (item: Book) => {
          ListItem() {
            Column() {
              Row() {
                Text(item.bookname)
                Text(item.author)
                Text(item.publisher)
                Text(item.id.toString())
              }.width('100%').height(70)
            }
          }.swipeAction({
            end: () => {
              this.getListEnd(item.id)
            }
          }).onClick(() => {
            this.isShowDetail = true
          }).bindContentCover(this.isShowDetail, this.BookDetailBuilder(item))
        })
      }.width('100%').padding(20)
    }
  }

  @Builder
  BookDetailBuilder(item: Book) {
    Column() {
      Row() {
        Image($r('app.media.ic_public_left_arrow')).width(50).aspectRatio(1).onClick(() => {
          this.isShowDetail = false
        })
        Text("当前管理员：" + this.creator)
      }.width('100%')

      Column() {
        Row() {
          Text(item.bookname)
          Text(item.author)
          Text(item.publisher)
          Text(item.id.toString())
        }.width('100%').height(70)
      }

      Column({
        space: 5
      }) {
        TextInput({
          placeholder: '图书名',
          text: $$this.bookname
        })
        TextInput({
          placeholder: '作者',
          text: $$this.author
        })
        TextInput({
          placeholder: '出版社',
          text: $$this.publisher
        })
        Button('点击提交').onClick((event: ClickEvent) => {
          this.putBook(item.id.toString())
        }).width('100%').enabled(this.bookname !== "" && this.author !== "" && this.publisher !== "")
      }.padding(20)
    }.backgroundColor(Color.White).width('100%').height('100%')

  }

  @Builder
  getListEnd(id: number) {
    Row() {
      Text("删除")
        .fontColor($r('app.color.white'))
        .width(100)
        .textAlign(TextAlign.Center)
    }.height(70)
    .padding({
      left: 20,
      right: 20
    })
    .backgroundColor(Color.Red)
    .onClick(() => {
      this.delectBook(id)
    })
  }
}

