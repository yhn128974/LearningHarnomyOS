class ContactContent {
  initial: string = ''
  nameList: string[] = []
}

@Entry
@Component
struct ContactsList {
  contacts: ContactContent[] = [
    { initial: 'A', nameList: ['阿猫', '阿狗', '阿虎', '阿龙', '阿鹰', '阿狼', '阿豹', '阿狮', '阿象', '阿鲸'] },
    { initial: 'B', nameList: ['白兔', '白鸽', '白鹤', '白鹭', '白狐', '白狼', '白虎', '白鹿', '白蛇', '白马'] },
    { initial: 'C', nameList: ['春花', '春风', '春雨', '春草', '春柳', '春燕', '春莺', '春蝶', '春蓝', '春绿'] },
    { initial: 'D', nameList: ['冬雪', '冬梅', '冬松', '冬竹', '冬云', '冬霜', '冬月', '冬夜', '冬青', '冬红'] },
    { initial: 'E', nameList: ['饿狼', '饿虎', '饿鹰', '饿豹', '饿熊', '饿蛇', '饿鱼', '饿虾', '饿蟹', '饿蚌'] },
    { initial: 'F', nameList: ['飞鸟', '飞鱼', '飞虫', '飞蜂', '飞蝶', '飞蛾', '飞蝉', '飞蝗', '飞鼠', '飞猫'] },
    { initial: 'G', nameList: ['孤狼', '孤鹰', '孤虎', '孤豹', '孤蛇', '孤鲨', '孤鲸', '孤鹿', '孤雁', '孤鸿'] },
    { initial: 'H', nameList: ['海鸥', '海龟', '海豚', '海星', '海马', '海葵', '海参', '海胆', '海螺', '海贝'] },
    { initial: 'I', nameList: ['火焰', '火球', '火箭', '火山', '火车', '火柴', '火把', '火鸟'] },
    { initial: 'J', nameList: ['金鱼', '金狮', '金刚', '金鹿', '金蛇', '金鹰', '金豹', '金虎', '金狐', '金猫'] },
    { initial: 'K', nameList: ['孔雀', '恐龙', '开心', '开怀', '开朗', '开拓', '开口', '开花', '开眼', '开天'] },
    { initial: 'L', nameList: ['老虎', '老鹰', '老鼠', '老狼', '老狗', '老猫', '老熊', '老鹿', '老龟', '老蛇'] },
    { initial: 'M', nameList: ['玫瑰', '牡丹', '梅花', '茉莉', '木兰', '棉花', '蜜蜂', '蚂蚁', '马蜂', '蟒蛇'] },
    { initial: 'N', nameList: ['南山', '南极', '南海', '南京', '南阳', '南风', '南瓜', '南竹', '南花', '南鸟'] },
    {
      initial: 'O',
      nameList: ['熊猫', '欧鹭', '欧洲', '欧阳', '欧文', '欧若拉', '欧米茄', '欧罗巴', '欧菲莉亚', '欧瑞斯']
    },
    { initial: 'P', nameList: ['苹果', '葡萄', '琵琶', '枇杷', '菩提', '瓢虫', '瓢泼', '飘零', '飘渺', '飘飘然'] },
    { initial: 'Q', nameList: ['七喜', '强风', '奇迹', '乾坤', '奇才', '晴天', '青竹', '秋水', '轻舞', '清泉'] },
    { initial: 'R', nameList: ['瑞雪', '瑞兽', '瑞光', '瑞云', '瑞彩', '瑞气', '瑞香', '瑞草', '瑞莲', '瑞竹'] },
    { initial: 'S', nameList: ['三羊', '三狗', '三猫', '三鱼', '三角', '三鹿', '三鹰', '三蛇', '三狐', '三豹'] },
    { initial: 'T', nameList: ['太阳', '天空', '田园', '太极', '太湖', '天鹅', '太空', '天使', '坦克', '甜橙'] },
    { initial: 'U', nameList: ['乌鸦', '乌鹊', '乌鱼', '乌龟', '乌云', '乌梅', '乌木', '乌金', '乌黑', '乌青'] },
    { initial: 'V', nameList: ['五虎', '五狼', '五鹰', '五豹', '五熊', '五蛇', '五鲨', '五鲸', '五鹿', '五马'] },
    { initial: 'W', nameList: ['悟空', '微笑', '温暖', '无畏', '温柔', '舞蹈', '问心', '悟道', '未来', '文学'] },
    { initial: 'X', nameList: ['西风', '西洋', '西子', '西施', '西岳', '西湖', '西柚', '西竹', '西花', '西鸟'] },
    { initial: 'Y', nameList: ['夜猫', '夜鹰', '夜莺', '夜空', '夜色', '夜月', '夜影', '夜翼', '夜狐', '夜狼'] },
    { initial: 'Z', nameList: ['珍珠', '紫薇', '紫霞', '紫竹', '紫云', '紫燕', '紫鸢', '紫藤', '紫荆', '紫罗兰'] },
  ]

  // 生成随机颜色
  getRandomColor(): ResourceColor {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgba(${r}, ${g}, ${b}, 0.5)`;
  }

  @Builder
  itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @Builder
  contactBuilder(name: string, color: ResourceColor) {
    ListItem() {
      Row({ space: 10 }) {
        // Image('/common/day01_03/06.List/ic_public_lianxiren.svg')
        //   .width(40)
        //   .fillColor(color)
        Text(name)
      }
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Text('通讯录')
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(20)
        // Image('/common/day01_03/06.List/ic_public_add.svg')
        //   .width(20)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#f1f3f5')

      List() {
        // 顶部
        ListItem() {
          Row() {
            // Image('/common/day01_03/06.List/ic_public_search.svg')
            //   .width(20)
            //   .fillColor(Color.Gray)
            Text('搜索').fontColor(Color.Gray)
          }
          .backgroundColor(Color.White)
          .width('100%')
          .height(40)
          .borderRadius(5)
          .justifyContent(FlexAlign.Center)
        }
        .padding(10)
        .width('100%')
        .backgroundColor('#fff1f3f5')

        ForEach(this.contacts, (item: ContactContent) => {
          ListItemGroup({ header: this.itemHead(item.initial), space: 10 }) {
            // 循环渲染分组A的ListItem
            ForEach(item.nameList, (name: string) => {
              ListItem() {
                this.contactBuilder(name, this.getRandomColor())
              }
            })
          } .divider({
            startMargin: 60,
            strokeWidth: 1,
            color: '#ccc'
          })
        })

      }
      .sticky(StickyStyle.Header)

    }
  }
}