import { AppBreakPoint, AppSafeArea, BreakPointType, HDMGoodsItem, ListDataSource, PAGE_PATH } from 'basic'
import { SearchSortItem } from './SearchSortItem'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { AppStorageV2, promptAction } from '@kit.ArkUI'
import { HDMGoods } from '../components'
import { JSON } from '@kit.ArkTS'
import { getSearchResultAPI } from '../api/search'
import { SearchParams, SearchRouterParam, SortCompAttr, SortField, SortMethod } from '../viewmodels/search_result'


@HMRouter({ pageUrl: PAGE_PATH.SEARCH_RESULT_PAGE })
@ComponentV2
export struct SearchResultView {
  breakPointClass: AppBreakPoint = AppStorageV2.connect(AppBreakPoint, () => new AppBreakPoint())!
  safeArea: AppSafeArea = AppStorageV2.connect(AppSafeArea, () => new AppSafeArea())!
  // 查询数据源
  lazyDataSource: ListDataSource<HDMGoodsItem> = new ListDataSource()
  // 查询参数
  params: SearchParams = new SearchParams()
  // 筛选条件
  sortList: SortCompAttr[] = [
    { label: '时间', field: 'publishTime' },
    { label: '销量', field: 'orderNum' },
    { label: '价格', field: 'price' }
  ]
  // 控制器
  scroller = new Scroller()
  //搜索结果
  @Local
  list: HDMGoodsItem[] = []
  @Local
  loading: boolean = false // 正在加载
  @Local
  finished: boolean = false // 是否完成

  aboutToAppear(): void {
    const routerParams = HMRouterMgr.getCurrentParam() as SearchRouterParam
    // AlertDialog.show({ message: JSON.stringify(routerParams) })
    this.params.keyword = routerParams.keyword
    this.getSearchResult(this.params)
  }

  //处理搜索
  async getSearchResult(param?: SearchParams) {
    // 第一种方案
    // const result = await getSearchResultAPI({
    //   keyword: this.params.keyword,
    //   page: this.params.page,
    //   pageSize: this.params.pageSize,
    //   sortField: this.params.sortField,
    //   sortMethod: this.params.sortMethod
    // })

    //第二种方案
    // const result =
    //   await getSearchResultAPI(JSON.parse(JSON.stringify(this.params).replaceAll(/__ob_/g, "")) as SearchParams)

    // 第三种方案: 拦截器中统一处理
    const result = await getSearchResultAPI(this.params)
    this.list.push(...result.pageData.items)
    //
    if (this.params.page >= result.pageData.pages) {
      this.finished = true
    } else {
      this.params.page++
    }
    
  }

  onRefresh() {
    this.params.page = 1
    this.list = [] // 重新赋值为空
    this.finished = false
    this.getSearchResult()
  }

  @Builder
  getFootBuilder() {
    Row({ space: 10 }) {
      if (this.loading) {
        Text("加载中...")
          .fontSize(12)
          .fontColor($r("[basic].color.gray"))
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
      } else {
        if (this.finished) {
          Text("没有更多啦")
            .fontSize(12)
            .fontColor($r("[basic].color.gray"))
        }
      }
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height(50)
  }

  build() {
    Column() {
      // 搜索区域
      Row() {
        Image($r('[basic].media.ic_public_left'))
          .width(24)
          .aspectRatio(1)
          .fillColor($r('[basic].color.white'))
          .margin(13)
          .onClick(() => {
            HMRouterMgr.pop()
          })
        Search({ placeholder: '商品关键字...', value: $$this.params.keyword })
          .searchIcon({ src: $r('[basic].media.ic_public_search'), color: $r('[basic].color.gray') })
          .placeholderColor($r('[basic].color.gray'))
          .placeholderFont({ size: 14 })
          .backgroundColor($r('[basic].color.white'))
          .textFont({ size: 14 })
          .layoutWeight(1)
          .padding(0)
          .margin(0)
          .height(36)
          .caretStyle({ color: $r('[basic].color.red') })
          .onSubmit(() => {
            this.params.page = 1
            this.list = [] // 重新赋值为空
            this.finished = false
            this.getSearchResult()

          })
      }
      .padding({ top: this.safeArea.topHeight, right: 16 })
      .linearGradient({
        angle: 135,
        colors: [[$r('[basic].color.linear_begin'), 0], [$r('[basic].color.linear_end'), 1]]
      })

      // list
      Row() {
        ForEach(this.sortList, (item: SortCompAttr) => {
          // 筛选组件
          SearchSortItem({
            label: item.label,
            field: item.field,
            sortField: this.params.sortField,
            sortMethod: this.params.sortMethod,
            // onSortChange: (field: SortField, method: SortMethod) => {
            // }
            onSortChange: (field: SortField, method: SortMethod) => {
              this.params.sortField = field // 相当于重新加载数据 排序字段
              this.params.sortMethod = method // 排序方式
              this.onRefresh()
            }
          })
        })
        Text('筛选')
          .fontSize(14)
          .fontColor($r('[basic].color.gray'))
      }
      .padding({ left: 16, right: 16 })
      .height(50)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({ width: { bottom: 0.5 }, color: $r('[basic].color.border') })

      //搜索展示区域
      WaterFlow({ scroller: this.scroller, footer: this.getFootBuilder() }) {


        // LazyForEach(this.lazyDataSource, (item: HDMGoodsItem) => {
        //   FlowItem() {
        //     HDMGoods({ goods: item, smallImage: true })
        //   }
        // })
        //
        Repeat<HDMGoodsItem>(this.list).each(obj => {
          FlowItem() {
            HDMGoods({ goods: obj.item, smallImage: true })
          }
        })
        //虚拟滚动是一种优化技术:
        // ● 它只会渲染可视区域内的组件
        // ● 而非一次性渲染全部内容，即便数据源规模很大。
          .virtualScroll() // 开启虚拟化
          .key((item: HDMGoodsItem, index: number) => `${index}_${JSON.stringify(item)}`)
      }
      .columnsTemplate(
        new BreakPointType({
          sm: '1fr 1fr',
          md: '1fr 1fr 1fr',
          lg: '1fr 1fr 1fr 1fr'
        })
          .getValue(this.breakPointClass.breakPoint)

      )
      .columnsGap(0.5)
      .rowsGap(0.5)
      .layoutWeight(1)
      .onReachEnd(async () => {
        if (!this.loading && !this.finished) {
          this.loading = true
          await this.getSearchResult()
          this.loading = false
        }
      })
    }
  }
}
