import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './serch_text.dart';
import './swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [
    'assets/images/ic_home_fmodel.png',
    'assets/images/ic_home_other.png',
    'assets/images/ic_home_activity.png',
    'assets/images/ic_home_photo.png'
  ];
  List ponList = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        title: Search(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              SwiperDiy(), //轮播图
              TopNavigator(
                navigatorList: list,
              ), //导航栏
              Container(
                width: ScreenUtil().setWidth(686),
                height: ScreenUtil().setHeight(1),
                color: Color(0xFFE2E2E2),
              ),
              RecommendShoot(), //推荐摄影
              RecommendModel(), //推荐模特
              Line(), //横线
              RecommendProduction(
                productionList: ponList,
              ), //作品推荐
              RecommendOfficial(
                productionList: ponList,
              ) //官方推荐
            ],
          ),
        )),
      ),
    );
  }
}

//顶部导航栏
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              item,
              width: ScreenUtil().setWidth(108),
              height: ScreenUtil().setHeight(108),
            ),
          ),
          Text(
            '模特',
            style: TextStyle(fontSize: ScreenUtil().setSp(24)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(180),
        padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
        margin: EdgeInsets.only(top: 10.0),
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            padding: EdgeInsets.all(4.0),
            children: navigatorList.map((item) {
              return _gridViewItemUI(context, item);
            }).toList()));
  }
}

//推荐摄影
class RecommendShoot extends StatelessWidget {
  const RecommendShoot({Key key}) : super(key: key);

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20), 0),
      child: Row(
        children: <Widget>[
          Text(
            '推荐摄影',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Text(
              '化妆',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Color(0xFF999999)),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          )
        ],
      ),
    );
  }

  //头像
  Widget _headPortrait() {
    return Container(
      height: ScreenUtil().setHeight(200),
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, 0),
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 5,
      //   itemBuilder: (context,index){
      //     return _item(1);
      //   },
      // ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
          _item(1),
        ],
      ),
    );
  }

  //内容
  Widget _item(index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(130),
        height: ScreenUtil().setHeight(130),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(8),
                    ScreenUtil().setHeight(8),
                    ScreenUtil().setWidth(8),
                    ScreenUtil().setHeight(8)),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFFF7E80)),
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: ScreenUtil().setWidth(45),
                  backgroundImage: AssetImage('assets/images/2.png'),
                  backgroundColor: Colors.white,
                )),
            Text(
              '杨小琳',
              style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[_title(), _headPortrait()],
      ),
    );
  }
}

//推荐模特
class RecommendModel extends StatelessWidget {
  const RecommendModel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: <Widget>[_title(), _modelList()],
      ),
    );
  }

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
      child: Row(
        children: <Widget>[
          Text(
            '推荐模特',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Text(
              '经纪',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Color(0xFF999999)),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          )
        ],
      ),
    );
  }

  //内容
  Widget _model() {
    return Container(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: ScreenUtil().setWidth(219),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(boxShadow: [
                //BoxShadow中Offset (1,1)右下，(-1,-1)左上,(1,-1)右上,(-1,1)左下
                BoxShadow(
                    color: Color(0xFFF5F5F5),
                    offset: Offset(1, 1),
                    blurRadius: 5),
              ]),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/3.png',
                    width: ScreenUtil().setWidth(218),
                    height: ScreenUtil().setWidth(218),
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: ScreenUtil().setWidth(20),
                            backgroundImage: AssetImage('assets/images/2.png'),
                            backgroundColor: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(10)),
                            child: Text(
                              '范冰冰',
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  //列表
  Widget _modelList() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), top: ScreenUtil().setHeight(20)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _model(),
          _model(),
          _model(),
          _model(),
          _model(),
          _model(),
        ],
      ),
    );
  }
}

//横线
class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(20),
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil().setHeight(30), 0, ScreenUtil().setHeight(30)),
      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
    );
  }
}

//作品推荐
class RecommendProduction extends StatelessWidget {
  final List productionList;
  const RecommendProduction({Key key, this.productionList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _title(),
          Container(
            height: 250,
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
            // child: GridView.count(
            //     physics: NeverScrollableScrollPhysics(),
            //     crossAxisCount: 3,
            //     padding: EdgeInsets.all(4.0),
            // children: productionList.map((item) {
            //   return _gridViewItemUI(context, item);
            // }).toList()),
            child: Wrap(
                spacing: 3,
                children: productionList.map((item) {
                  return _gridViewItemUI(context, item);
                }).toList()),
          )
        ],
      ),
    );
  }

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '作品推荐',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Icon(
            Icons.cached,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '换一换',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Color(0xFF999999)),
            ),
          ),
          Text(
            ' | ',
            style: TextStyle(color: Color(0xFF999999)),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '更多',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Color(0xFF999999)),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: GestureDetector(
        onTap: () {
          print(item);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(210),
              height: ScreenUtil().setWidth(210),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/4.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: ScreenUtil().setWidth(20),
              bottom: 20,
              child: Text(
                "潮牌写真",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//官方推荐
class RecommendOfficial extends StatelessWidget {
  final List productionList;
  const RecommendOfficial({Key key, this.productionList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil().setHeight(20), 0, ScreenUtil().setWidth(20)),
      child: Column(
        children: <Widget>[
          _title(),
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
            child: _item(),
          )
        ],
      ),
    );
  }

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20), 0),
      child: Row(
        children: <Widget>[
          Text(
            '官方推荐',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          )
        ],
      ),
    );
  }

  //列表
  Widget _item() {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[200],
              offset: Offset(1, 1),
              blurRadius: 3,
              spreadRadius: 0.1),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[_itemTitle(), _itemContent()],
        ),
      ),
    );
  }

  Widget _itemTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: ScreenUtil().setWidth(30),
            backgroundImage: AssetImage('assets/images/2.png'),
            backgroundColor: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Text(
              '范冰冰',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/zan.png',
                  width: ScreenUtil().setWidth(48),
                  height: ScreenUtil().setHeight(42),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      ),
    );
  }

  Widget _itemContent() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
      child: Column(
        children: <Widget>[
          Align(
            child: Text('Mrswang夏季新品服饰写真集'),
            alignment: Alignment.centerLeft,
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(20),
                bottom: ScreenUtil().setHeight(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Wrap(
                  spacing: 3,
                  children: productionList.map((item) {
                    return _gridViewItemUI(item);
                  }).toList()),
            ),
          ),
          Row(
            children: <Widget>[_tip()],
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(item) {
    return Container(
      margin: EdgeInsets.only(top: 1.5, bottom: 1.5),
      child: GestureDetector(
        onTap: () {
          print(item);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setWidth(200),
              child: Image.asset(
                'assets/images/2.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tip() {
    return Container(
      width: 40,
      height: 18,
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xFFFFAF3B))),
      child: Align(
        child: Text(
          '夏天',
          style: TextStyle(
              color: Color(0xFFFFAF3B), fontSize: ScreenUtil().setSp(20)),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
