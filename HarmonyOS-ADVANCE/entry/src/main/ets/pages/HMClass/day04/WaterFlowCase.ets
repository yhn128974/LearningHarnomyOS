class WaterFlowItem {
  nickName: string = ''
  avatar: string = ''
  cover: string = ''
  likedCount: string = ''
  displayTitle: string = ''
}

@Entry
@Component
struct waterFlowDemo {
  list: WaterFlowItem[] = [
    {
      nickName: 'momo',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/c94b2589011be6d87bfbbbf21db9e2a0.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/fd93e706458d6a1a3814505d71ad33da/1040g00830tk6qkkdke005p143e14c994esilqvg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '欣赏不了这种衣服 '
    },
    {
      nickName: '樱桃大丸子',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30rqipkliig5g48n5q32kql45q0qi75o',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/073aedf45cb8901a858ea8683db0675f/1040g2sg30tbsq1c83s6048n5q32kql45mdr0leo!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '游戏惩罚来了，哈哈哈'
    },
    {
      nickName: '昆明小人国',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/63954c9e6df4659bef6af0ca.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b575d5f8345aa9af818cc92cf34fa30f/1040g00830tb5qqqkju005oqmfib65jqup31n8k0!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '#矮人王 告别2023'
    },
    {
      nickName: '肥婆天天想瘦',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30r1nlon3hk6g5p6mu9nghgp7ftvb90g',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b17ab3b4895d84d2a1680aef40ce6cf7/1040g2sg30t8ifsom3q6g5p6mu9nghgp7ae7lfo8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '这种尴尬的事竟然发生在我身上'
    },
    {
      nickName: '别急我们会有橘猫的',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/5f6e6fc6dc09f50001d720f9.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/60853910793cf80f7eeee684e8816135/1040g2sg30tt7tig3ke005n1i333ha3f57lho7m8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '这是哪位少爷的limo'
    },
    {
      nickName: '武术小豆丁',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/644b82485f098f6d8cbbbc02.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/0b1cbd68cff2c1694fdb22de5762c7f9/spectrum/1040g0k030tr7f9834m004a1a014iuhsju40pmg8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '是时候放出完整版了，最后几秒太帅了！'
    },
    {
      nickName: '尚品工匠奢侈品技术服务',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/642f803b63cf320001187e9e.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b7c01b6d2d1f6972f80d875436e5e7b0/spectrum/1040g0k030ts609nlkk305o3u8un08cpfck43o88!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '香奈儿古巴绿调色教程！'
    },
    {
      nickName: '叶子吖OHYEZI',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/5f2d9698f7c23e00017d4a78.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/f0da9dcb8bf6a632ee045473caf0fdd5/1040g00830tkpi6kq4i6g49cq9f9d71d82q6och0!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '耗时5天！我发现了0失败的奶泡配方？！'
    },
    {
      nickName: '野莉',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/62efb5d043e7829cb8a36894.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/a1f7f3baa586afc6956bd8edcf56bb7d/1040g2sg30stp3vc9k2e05n171pi1o3evcu898r8!nc_n_webp_mw_1',
      likedCount: '40w+',
      displayTitle: '🐶：我这一生如履薄冰'
    },
    {
      nickName: '科研小助手_Lucky',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30pejs1n15m605p8hah7ghgk26c29b68',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/18e4f1538ff424c57154f6fe5cc2a50e/1040g2sg30t9o2cknk6605p8hah7ghgk2f87k0fg!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '科研去魅 '
    },
    {
      nickName: '美式要加冰',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/638a45238aca764ec606f179.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b5314b1f5e185d153b9e7206c78bd2d5/1040g00830tg9k0g7jq005oikvsi8d5b8t86fr5o!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '沉浸式采购｜打工人又来山姆补货了🛒开森呀～'
    },
    {
      nickName: 'MusicArt',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/65570606e0cc0eb38096989e.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/20231487eabcc4d3c62adb0481011b0a/1040g2sg30t6k4tm844005n5vqlulqvstvqtpgi0!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '治愈音乐分享 🎵 '
    },
    {
      nickName: '森林八哥',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/637adca48504875319b3ca0a.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/ca39d17edf1ea3651fcf999b0b494576/1040g2sg30thlsati4u505nv98mj095nf538v4so!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '鹈鹕胃口真大！ '
    },
    {
      nickName: '像小狗一样勇敢',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30rj6ahnqii5g5o68gg9g83pmm6a6r80',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/39a386ab7282408a81e77be3a0612cb1/1040g00830t791e4mju6g5o68gg9g83pm3pjflc8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '想看看被要vx的女生长的多美（尽情凡尔赛'
    },
    {
      nickName: '折纸小匠人',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6576f9e08548425d6edaff31.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/641b5eaba695e79eeb015bff519fd519/1040g00830tdprc1sjs004a6uad9i9du61bhaakg!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '折一个金箍棒 伸缩自如'
    },
    {
      nickName: '王孟南台球教学球杆号',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6321a1d1ff4a828a63940180.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b2d1bf06c58854ad892aabc434aa381b/110/0/01e598c48511e6b40010000000018cdcbfcc6b_0.jpg!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '台球小白变高手的第一天'
    },
    {
      nickName: '十三快变胖',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6442a787fe6243cd283b397c.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/d174d787d15d1edc43b395b62ec874e8/1040g00830st2pk4s4a005ose26vnrdhoalrnnrg!nc_n_webp_mw_1',
      likedCount: '10w+',
      displayTitle: '哈哈哈哈哈相当于有个暖宝宝了！'
    },
    {
      nickName: '开饭了大熊猫',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6391c360574477d388e417df.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/83b69046fc05d72aae845b72243ecd44/110/0/01e57a7b8610f8fa0010000000018c6672901f_0.jpg!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '熊猫宝宝必上的一课 '
    },
    {
      nickName: '毛肚儿精',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30tv44vbc4m005nlvhqvgbpj7rb9h0uo',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/c11de729f204f2e2784b3f1990dc43e9/1040g00830tnj6k6vks005nlvhqvgbpj784d4od8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '小羊小羊告诉我 今天吃什么|石塑粘土'
    },
    {
      nickName: 'Dottie在伦敦',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t7f28n2jq005pboj6o868b244un60o',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/312eaf9e4bf3a47217e1df8dc37897a9/1040g00830tl76lgcks005pboj6o868b2fa4ri6o!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '🇬🇧真的没想到有一天会和那英成为邻居…'
    },
    {
      nickName: 'S嘉阳',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/64ec3d174db59319170a6148.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/aade6983cb2c79addbc8f315b445758f/1040g2sg30toqamnn4i005omffviggalups3m18g!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '真绝啦‼️华为电池养护‼️再用两年‼️'
    },
    {
      nickName: '米子米子',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t7plpi6k2004a36sn3rpd7n7hiadq8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/2b047d68d4e062aaaaba8131a424ccc9/1040g00830tqiuibskk004a36sn3rpd7nsjb3vv0!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '看小狗有种岁月静好的感觉'
    },
    {
      nickName: '火山爆护',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/652598f1bac0f9be9febade2.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/25aa8354495509831ea87526803c0ce2/1040g2sg30tk739ui4i005odn6dt413u7keack1g!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '野采的乐趣在于过程。橙剑尾鱼'
    },
    {
      nickName: '莫弈亲亲亲亲亲',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6571ac1f1f3247d9647f0175.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/062cbc3171b47902b5a6904cd90babf5/1040g00830tfq1trojq005of1dca4180umeorho8!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '求求成人礼服推荐 '
    },
    {
      nickName: '王嫩蝶',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/651590859df2ed9b39020a1e.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b4766194cb36414011d6a856983883e9/spectrum/1040g0k030t4mqiagjs005no6ni20bmlm1jribvo!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: 'i人独自出门怎么拍？！学会解放双手'
    },
    {
      nickName: '暖暖捂不热🎀',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/63d8563d952f9cbe57b9b867.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/b400cd1c28e48e0e06b4b06b21be87d3/1040g00830trhm4jl50005n4at9ik23fo6dfh13g!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '🇫🇷单板下欧洲最难黑道Grand Couloir🖤'
    },
    {
      nickName: '卷卷',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/611b550245a58514b4880d88.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/9548e40ec67c451473bde53942d70698/spectrum/1040g0k030trrv6fql0005nti4angblpfjctu208!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '看似简单葱饼原来并不简单。'
    },
    {
      nickName: 'CC',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6526960ea3a5f1ff836a4313.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/eb8b0dff0b23eeca8ee3756e1d61b744/1040g00830tpbnv8e4u0049v0a3hctlgnlmvmlh0!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '为啥小时候好看 长大却长残了'
    },
    {
      nickName: '洋芋公主（努力版）',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6340557caed567c7723f0d6c.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/7c94de2640ccd7475fae51d7159c83d3/1040g2sg30tg9li2d4s0g5o70e4g092fqas77eno!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '100克99r的瑞士国宝级巧克力🍫来广州了'
    },
    {
      nickName: '雨中漫步',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/645b6abf2e368555521befcc.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/606177dfe99e3e24009f1924412d6876/1040g2sg30t8dj21kk25g5paff1nh7f8ui4t2al8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '家里找到有这三款一分的硬币就发财了纪念币 古钱币 钱币收藏 硬币 纸币 古钱币收'
    },
    {
      nickName: '看图装修',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t21bnpu46005o9n0g30k0h3n3rpgko',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/5009acebb41840a53514447bfa141630/1040g2sg30tb50glfk0005o9n0g30k0h3m9o7ofo!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '最容易遗漏21个插座'
    },
    {
      nickName: '是花花不是冬瓜',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30s9rbs7m2i005n834js5l9h62ghpaeg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/d2363f9ce131fc673cbea9d1cb614b90/1040g00830tiq402aki005n834js5l9h6l9g2dn8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '宝宝你居然是个双面冬瓜'
    },
    {
      nickName: '溜达哥在韩国',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/63f0a8e15cf2aaee776c1246.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/8a89acfb4ce1dd97fa0b7a3071d634da/1040g2sg30t3f82r13q6g5ov65u69glusneq2260!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '韩国发现山东囤，村里面都中国是山东人，如今已有1000多年了，还保留从山东带来的'
    },
    {
      nickName: '赫本乌',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30thk41dg4k6g5pcncpt7q056imr36j8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/0bc75875123a71ca392a87209ddabdfd/1040g00830trqrdmfko605pcncpt7q0563gvq660!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '回到乌黑秀发 '
    },
    {
      nickName: '小许👑',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30s7a674kig705o824ke0bpc7lmc3nq0',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191532/6b7fc9320059fdb5e99a1f3e2778d0f6/1040g2sg30tt6cn1akk005o824ke0bpc7s7jc4a0!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '高中vs大学 '
    },
    {
      nickName: '智慧少女爱秃头',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/65864e5b7a60385fb7941bf6.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/275845c206472bb184a39bba7eb19f94/1040g2sg30tm8lgpp4k005otmhiuptc5dv0eam48!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '男票的拍照技术大比拼？一个比一个离谱！'
    },
    {
      nickName: '阿拉贡',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30sf3dp7dja6g5ni7lslg8br2p9j4km8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/d70864eb79bd68eb66fd50e575b9045b/1040g2sg30tqil9nf4k6g5ni7lslg8br2u5p59f8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '哈佛研究：孩子出生月份影响智商'
    },
    {
      nickName: '腕尚说',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/62ee58a0fc91c79acb6ecdf6.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/86ee8dcfd8642a8fde85a1ccb0b0de3f/1040g00830tdn0q673u005ob0svagjea722pqsa0!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '还记得这位女艺人吗？'
    },
    {
      nickName: '富贵娘娘今天辞职了吗',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/64c27461d5bf146d0a2c156b.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/178aeb3d80e7c45d308ca3c7222eb2c8/1040g00830tt75jmmkm0041005fsmu61dqoffge0!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '突然我就社恐了😅天津爱马仕购物超愉快'
    },
    {
      nickName: '董小姐的下午茶',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/64ccb2b9f683aebc87f71d2d.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/50b7d4fe35b06f0a62418ab9fb3f77c0/1040g2sg30tt556v350305or8vfi7rui7mgcd9mg!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '用饮料做6道网红年夜饭！99%的人没见过！'
    },
    {
      nickName: '装修帮',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6192609d5430dec88fb1d456.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/093f9ab20da7dcbc4527c4e31ad385cd/spectrum/1040g0k030sj0tbb23m004a2v96aeiad4emtqnoo!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '细节满分的分区设计不仅收纳多，拿取更轻松'
    },
    {
      nickName: '嘉嘉锻炼分享',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1000g2jo2lokfp7cii0605p4dp0ajogn1gtv5bf8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/93e486d18e66fdac91a8375fb41d695c/1040g00830t8e5tmfju605p4dp0ajogn14mv0ngo!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '每天坚持锻炼会有不一样的收获 居家锻炼 一起来锻炼'
    },
    {
      nickName: '小了个k',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1000g2jo2qc165l2js000416gjm8gaqocqe2or10',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/eaf508cb2d02f8f0bbcd854f531c53e0/1040g00830svk0naik400416gjm8gaqocet771i0!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '再见了北京的第一个家'
    },
    {
      nickName: '青年湖南',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30ptjo2mfmi005p90kdep2t0v5s7dnr8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/f624bd69e45eb1d90d45d32f1d068e5d/1040g2sg30tp7egu04i005p90kdep2t0v17hbhkg!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '“头发越来越少的原因找到了”'
    },
    {
      nickName: '丛小吖',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/62a48de285527482a6dd2ec5.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/fc8258e558107246f220cb82d4afefd3/spectrum/1040g0k030tit3q9e4i005njb9i108504bn2pss8!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '爸爸不给买锅巴那就自己做，自己做的更好吃'
    },
    {
      nickName: 'Hey小黑',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/63db81a89619a572fde5bdcf.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/902f0290e68544b378f1a96a13ee2c5f/spectrum/1040g0k030smr3unuk4005ouq55qpt27c57ajmf8!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '神秘石窟里竟隐藏着大量文物痕迹！'
    },
    {
      nickName: '小希与阿树',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6013d0c0b8b325b6871ead92.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/2266de34cd666fde2827ceb1ffaed17c/1040g2sg30t0m0il83u005o0d8m0g8klea0dajq0!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '在家里🆚在外面！谁还没有两幅面孔了！'
    },
    {
      nickName: '安崽成长日记',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30r0k7atdhk005n5f3rklqnsu3cf0258',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/e68a487a56975871ee167068cd6166bd/1040g00830su9r5ajk6405n5f3rklqnsuv2bisqg!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '可爱鼠了！！！ '
    },
    {
      nickName: '卷心菜菜菜（读研版）',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30rdcucgjhi005nglnq4098sepu5eff0',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/7e6ae6da713c63aae3f01c906890f130/1040g2sg30trpln6ukq005nglnq4098se3ri52m0!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '听劝，闲钱应该放余额宝还是放银行啊？'
    },
    {
      nickName: '熙妈喊你吃早餐',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6325e01df0ed88aca1fa88a1.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/e6520f33c51f18b3e85109b75f40222a/1040g00830tos826a4e005olpkac6d49c7ecch50!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '家有小学生｜挑战儿童早餐1000天不重样'
    },
    {
      nickName: '姜姜咚咚锵',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/5fe9e63a47c112582a761e4c.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/4797e1b261d6d48da5dc3c66c4ed31e4/1040g00830teu3ti746005neap7n092vtlji6sio!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '这大概就是在农村盖房子的意义吧～'
    },
    {
      nickName: '爱抓娃娃的嘀嗷嘶',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/640367ad2cce174c505363c3.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/c31006173dd56c2e8d511fd2ea05ddac/1040g2sg30thgjihp4o0g5nhrvfjg9b84f8urlf0!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '切勿模仿啊🤫🤫 '
    },
    {
      nickName: '大齐赶海',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/6220d2a95a37a06552bed4aa.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/5510776b199dd29fa689cb632e873c14/spectrum/1040g0k030tt6tffo4q005ogpqb3od16dugrejpo!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '用大漏勺捞到一桶海鲜，带回家做海鲜锅'
    },
    {
      nickName: '公基常识',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30sp5c7814a6g5nndb4i08pce4avbt78',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/e744cafbbd80984c7ae1a67247fdc693/1040g2sg30t3f91qek45g5nndb4i08pce9vfpih8!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '每日一练，今天你答对了吗？'
    },
    {
      nickName: '三只布朗熊.🐼',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30q4hg6ian8005n3fcq8417jbr3job70',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/511855e199d7e208701c5e52461e9626/1040g2sg30tt3qpq34e6g5n3fcq8417jbcsu4r4o!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '中国唯一以水果命名的城市'
    },
    {
      nickName: '画景',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/64d9d76088117ec371221310.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/6fe79fd5655550544c93ba7632299154/1040g00830sspdn8i3q005oe97htk167tr3kk7u8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '这么好看的雪玫瑰屋,一定要分享给你公主看'
    },
    {
      nickName: 'momo',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/645b806f731e07eb8ca3d845.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/3e8dfd25241300de3b652d1499dd53d5/1040g00830tt7ce6q4s6g5p9judd0rr74e4l301g!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '我脑容量有点不够。。。'
    },
    {
      nickName: 'BaristaCindy',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30sud2o9pk2004a51bsqm14ka99kht78',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/c9b99b83561a68c752376ad834209a37/1040g00830tsvpn5t4m004a51bsqm14kamqrj8h8!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '🧊ICE Baby'
    },
    {
      nickName: 'OH歆的路程',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30nimcodv720g4a0rl9l4b35orp1kth0',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/132a8e7bbda67ac7931c02d6753e88a6/1040g00830stvvvrkjq004a0rl9l4b35omahnnt8!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '那些看车牌就知道是华人的车🤣'
    },
    {
      nickName: 'Conqueror✨',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/652825489e93d5bdfb8ab323.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/3222b815708f6ca01eddfe22ece0621f/1040g2sg30t5f5u56ka005nqfniu087f68v48c60!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '生活可以平凡，梦想绝不平庸。'
    },
    {
      nickName: '子瑜_Yuri',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/64e47fc65b76ccbe4fc1c72c.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/b4551222e18fdfc73c5fb111a72cc6da/spectrum/1040g0k030t9qo39hka005p1m3433b4cbuq4b7r0!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '美术生刮刮乐化妆！挑战不翻车！'
    },
    {
      nickName: '💛银河小奶糖',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30n7df6rk5a5g5p5g0e0qp6lads0kki8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/1f0f1ac4a5cdb5c33d985bb20d7c0219/1040g00830tg7738sk2605p5g0e0qp6laqdagdq8!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '真正的有钱人 真的很低调'
    },
    {
      nickName: '莓莓爱养生',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t0b1ieek46g5oq9alq652ij0r26m0g',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/008bd91c2ac87bbe07a1cf6a136cd97a/1040g00830t629tf1k2505oq9alq652ijhgcv0t8!nc_n_webp_mw_1',
      likedCount: '7',
      displayTitle: '一张图告诉你，不同部位长痘原因'
    },
    {
      nickName: '有痣之士叨叨吖',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30nrvj7tc1c6g5nui6ujgbndo29a7ojg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/8dcfdd8708f874df8d3119a223d14233/1040g00830trsmnes4q005nui6ujgbndo1kbq1u0!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '假如我当了老师……一场畅快淋漓的撕伞行动'
    },
    {
      nickName: 'NN(专业银元收藏）',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/60f10f58512609f09a159a49.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/885e726e54982716366c6ef1444759c5/1040g00830tg3vmts40005na3e2h4hbiqdpbtls8!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '出价8万对方不卖，最后加价到12.6万卖我。'
    },
    {
      nickName: 'YaYa探新西兰',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/5fb7664989f01e0001e03d58.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/ceeab9dcaa32ff90bc6d9f5204b2bfb7/1040g2sg30tqkuaag4u004a5t05r01s2tg37o7h0!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '咱这是发现野生杨梅啦？！'
    },
    {
      nickName: '舍＋予=舒',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30qirffa808005nuaals08f48ce7lov0',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/96037e2859b1eb213b74fe7d4bf35a3b/1040g2sg30thk9sjuku005nuaals08f48935vhsg!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '救命🆘知道单词意思后，不忍直视膳魔师了！'
    },
    {
      nickName: '有家装饰🏠',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/655d8de10e447f42e0b35a0d.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/f802c9911b52a1226140eaac845dc11a/1040g00830srns7kkju005o8lqha08734ufh3tqg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '3年后必火的小卧室装修！'
    },
    {
      nickName: '飞行家航空票务服务有限公司',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/653b1a0e729bc400014f790d.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/4a4056c964aba5179af1b51faced5c9d/1040g2sg30tauca60426g4bmrfjsknp9jpf5khko!nc_n_webp_mw_1',
      likedCount: '1k+',
      displayTitle: '从小红书学到的，从此再也没坐经济舱啦！'
    },
    {
      nickName: 'Margarita绘画',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/529594cd91bbf4c43608131bf9134bdc.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/a2378f7a3586c4ee4ccf6dda5e2383b9/spectrum/1040g0k030snle8cd3s705oiuhl3oc1hotsu3590!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '【丙烯画】初学者如何用丙烯画《木之森森》'
    },
    {
      nickName: '开水白雪',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30n4ra4uh5k6g5o4bm4t084i2o5m1o6g',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191537/2ced273c1d6b1dc11c139ed98db39e73/1040g00830t2612pa44005o4bm4t084i2a38fo0g!nc_n_webp_mw_1',
      likedCount: '1w+',
      displayTitle: '0成本自制香水，没人比我更会省了吧！'
    },
    {
      nickName: '刘士心',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30s6bo8ur2g605p9hrlvql15r5achoqo',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/35c6c3d3640fc1b96995d01b5c21d42b/1040g00830sk0ebfn3e7g5p9hrlvql15rtnvqgr0!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '情侣之间一定要聊的40个话题'
    },
    {
      nickName: '南浔柜猫整装',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30snn3b2qjs6g5pbsugp6dq7ja5ua758',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/af731b40445df51fa63da2ad1a84faa6/1040g00830t0o4gsg3q005pbsugp6dq7j0u3de1o!nc_n_webp_mw_1',
      likedCount: '9',
      displayTitle: '全屋定制的干货❗️干货❗️抓紧收藏点赞❗️'
    },
    {
      nickName: '北京普芯信息咨询',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/8e01dc3e-87fe-3ac9-9b55-64d4ae25dd97',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/61df505ca9e07fdb6e44e9b5160d8226/spectrum/1040g0k030t6ceca442005pbe8d66aaii7up2fug!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '提前还款，你一定要弄清楚这些，千万别瞎还'
    },
    {
      nickName: '小草',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30pl3evbr6k0040osbrp5luh16jbrih0',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/927a6184dadf2fe28c147231f77dcba8/1040g00830to0gkq14e2g40osbrp5luh1ibra2cg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '作为剖腹产过来人，告诉你这些到底要不要用'
    },
    {
      nickName: '花小花的花',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30te0rn5jk0005og4altk1ctt9j8vblg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/76473de8df6f88a3499b3e9d920d8d5f/1040g2sg30tg4brurk2005og4altk1ctta9ddqt8!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '真的！👉客厅这样摆好运提升百分比💯'
    },
    {
      nickName: '武汉全屋定制避坑专家',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30sisna0k3a505pbo0dnvde0t432c6oo',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/4b321fe083dd628c5ed442d82c01ea09/1040g2sg30tqba86c501g5pbo0dnvde0t4h1bmto!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '全屋定制细节避坑 柜子验收篇'
    },
    {
      nickName: '小柒设计',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/627b27926aed95891284846b.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/25cab2a9993ae8e6d335f808804de1fd/1040g00830tqkhcerku205nr5e9a080of0edrs3g!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '新风系统最全总结 共17页'
    },
    {
      nickName: '别人家的家装日记',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30ti7v7rako6g5o223kvg8860v16in60',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/da7c8da2261d51d091ea471b7da339bc/1040g2sg30terdtdk3q6g5o223kvg8860m4fpktg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '木工吊顶，不想返工前需要了解的细节'
    },
    {
      nickName: '易冠起名文化',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/60eae11098d29e5b1e8f61fc.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/fd9f6d13e5e43f5333c076570447a493/1040g2sg30t8kvddh446g5nrqrotg8hu1tirnfpo!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '24年宝宝取名:清雅温柔的宝宝名字'
    },
    {
      nickName: '橘子小姐',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30s8unaeg2g6g5o4pvhd0bhcfcpv3sbo',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/c6599ec6e3fc905336d62f594f0a661a/1040g00830t8eivdoju605o4pvhd0bhcfcv53ft0!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '窗帘不会选，一篇看懂【纯干货无广】'
    },
    {
      nickName: '财多多女士',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/611948370b6a36112e69c291.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/54fd6fd8859da0776382b1aee2d92d04/1040g2sg30trla02vl000497dhbsq2hk8pn49hhg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '凌晨发现男朋友已经买好了求婚戒指💍'
    },
    {
      nickName: '4152532516',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30sjafq1n3a5g5ol9r9p5bqpgl9ashm8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/f9e13d6b9da71d915c346fe1f36f2f48/1040g2sg30trrs18dkq6g5ol9r9p5bqpg0849evg!nc_n_webp_mw_1',
      likedCount: '4',
      displayTitle: '家里装监控的 尤其是卧室，要注意⚠️'
    },
    {
      nickName: '洋葱蜗牛的家',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/659e3e69c67a69cdb739faef.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/5c6c5cc2a5e4d8ac68c406758ff167b6/1040g2sg30t8l7mc0jq005n2usvt6ok5r16u3g8o!nc_n_webp_mw_1',
      likedCount: '100+',
      displayTitle: '厨房装修想要不出错，注意这十一个细节，装出来的厨房好看又实用！厨房装修 装修避坑'
    },
    {
      nickName: '零度E家整装',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/60dabed54baef500017db9aa.jpg',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/8d4daefcd877b848cbf60e4daf2a9bdb/spectrum/1040g0k030tdlp2063u005o6qnk685otfs5fa3qg!nc_n_webp_mw_1',
      likedCount: '8',
      displayTitle: '求求不要过度装修，盲目跟风后悔莫及啊😭'
    },
    {
      nickName: '是孙教哦！',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t5snkld40605nshdqcg8f5pfvirv7o',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/93dea2b5c44e69dc2ac66bd9cba7d8fc/1040g00830teulagm42605nshdqcg8f5p04ehlio!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '力量训练，肩不黄金动作，看你做对了嘛？'
    },
    {
      nickName: '一灯房产从业日记',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30t8r9mvh3s6g5npujeg09972ojbgp9o',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/507e8f7522f59c2db96376cca32d4e38/1040g2sg30t22fp2e4a6g5npujeg099723bc5mcg!nc_n_webp_mw_1',
      likedCount: '10+',
      displayTitle: '未来你们80%房产从资产角度将失去持有价值'
    },
    {
      nickName: 'BIGBIG大元宝',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30r7hcrtahg5g5paa9580hkapip6nru8',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/b3ded0e739d408b16c2a01a7f3706167/1040g00830t7a0pnl44505paa9580hkapm5slgv0!nc_n_webp_mw_1',
      likedCount: '5',
      displayTitle: '坐月子 八个禁忌 '
    },
    {
      nickName: '花园故事',
      avatar: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30n8suukjli6g5ovkc12jq8eqhoi9ejo',
      cover: 'http://sns-webpic-qc.xhscdn.com/202401191539/9d406fa6c04211d24039770919dbf433/1040g2sg30tn1mljdko6g5ovkc12jq8eqgqkfjn8!nc_n_webp_mw_1',
      likedCount: '7',
      displayTitle: '每天一种花草养护知识 | 龙血树'
    }
  ]
  scroller=new Scroller()

  @Builder
  Footer() {
    Row() {
      Text('加载更多').fontSize(26).fontColor(Color.Pink)
    }
  }

  build() {
    Column() {
      Image('/common/day04_05/04.waterFlow/IMG_5920.jpg')
        .width('100%')
      WaterFlow({footer:this.Footer,scroller:this.scroller}) {
        ForEach(this.list, (item: WaterFlowItem, index: number) => {
          FlowItem() {
            Column() {
              Image(item.cover)
                .width('100%')
                .backgroundColor(Color.Gray)
              Column({ space: 10 }) {
                Text(item.displayTitle)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Row() {
                  Row({ space: 5 }) {
                    Image(item.avatar)
                      .width(20)
                      .borderRadius(10)
                    Text(item.nickName)
                      .fontSize(12)
                  }

                  Row({ space: 5 }) {
                    Image('/common/day04_05/04.waterFlow/ic_public_favor.svg')
                      .width(15)
                      .fillColor(Color.Gray)
                    Text('xxx')
                      .fontColor(Color.Gray)
                      .fontSize(12)
                  }
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .padding(10)
            }
            .borderRadius(5)
            .clip(true)
          }
          .backgroundColor(Color.White)
        })
      }
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor('#f3f3f3')
      .rowsGap(5)
      .columnsGap(5)
      .columnsTemplate('1fr 1fr')
      .padding(5)
      .layoutWeight(1)
      .scrollBar(BarState.On)

      Image('/common/day04_05/04.waterFlow/IMG_5921.jpg')
        .width('100%')
    }

  }
}