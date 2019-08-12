import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './serch_text.dart';
import './swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [1, 2, 3, 4];
  List ponList = [1, 2, 3, 4,5,6];
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
                RecommendShoot(), //推荐摄影
                RecommendModel(), //推荐模特
                Line(), //横线
                RecommendProduction(productionList: ponList,), //作品推荐
              ],
            ),
          )
        ),
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
              'assets/images/home_green.png',
              width: ScreenUtil().setHeight(50),
              height: ScreenUtil().setHeight(50),
            ),
          ),
          Text('模特')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(343),
        height: ScreenUtil().setHeight(90),
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(top: 10.0),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.5, color: Color(0xFFE2E2E2))),
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
      height: ScreenUtil().setHeight(20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: <Widget>[
          Text(
            '推荐摄影',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '化妆',
              style: TextStyle(fontSize: 15.0, color: Color(0xFF999999)),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: 18.0,
          )
        ],
      ),
    );
  }

  //头像
  Widget _headPortrait() {
    return Container(
      height: ScreenUtil().setHeight(130),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setHeight(60),
        margin: EdgeInsets.only(left: 20.0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFFF7E80)),
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/home_green.png'),
                    backgroundColor: Colors.white,
                  )),
            Text('杨小琳')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(150),
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
      child: Column(
        children: <Widget>[
          _title(),
          _modelList()
        ],
      ),
    );
  }

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: <Widget>[
          Text(
            '推荐模特',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '经纪',
              style: TextStyle(fontSize: 15.0, color: Color(0xFF999999)),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: 18.0,
          )
        ],
      ),
    );
  }

  //内容
  Widget _model(){
    return Container(
      width: ScreenUtil().setWidth(110),
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/1.jpeg',
              width: ScreenUtil().setWidth(109),
              height: ScreenUtil().setHeight(109),
              fit: BoxFit.fill,
            ),
            Container(
              height: ScreenUtil().setHeight(36),
              width: ScreenUtil().setWidth(108),
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                //BoxShadow中Offset (1,1)右下，(-1,-1)左上,(1,-1)右上,(-1,1)左下
                boxShadow: [
                  BoxShadow(color: Color(0xFFF5F5F5), offset: Offset(1.0, 1.0), blurRadius: 3),
                  BoxShadow(color: Color(0xFFF5F5F5), offset: Offset(-1.0, 1.0), blurRadius: 3)
                ]
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 16.0,
                    backgroundImage: AssetImage('assets/images/home_green.png'),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text('范冰冰'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  //列表
  Widget _modelList() {
    return Container(
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(left: 15,top: 20),
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
      height: ScreenUtil().setHeight(10),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5)
      ),
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
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: <Widget>[
          _title(),
          Container(
            height: ScreenUtil().setHeight(250),
            padding: EdgeInsets.only(left: 15),
            margin: EdgeInsets.only(top: 15),
            child:GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            padding: EdgeInsets.all(4.0),
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
      height: ScreenUtil().setHeight(20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '作品推荐',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(
            Icons.cached,
            color: Colors.grey,
            size: 18.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '换一换',
              style: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
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
              style: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: 18.0,
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return GestureDetector(
      onTap: () {
        print(item);
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(105),
            height: ScreenUtil().setHeight(105),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/1.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Text("潮牌写真",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}