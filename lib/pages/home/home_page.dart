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
          child: Center(
        child: Column(
          children: <Widget>[
            SwiperDiy(), //轮播图
            TopNavigator(
              navigatorList: list,
            ), //导航栏
            RecommendShoot(), //推荐摄影
          ],
        ),
      )),
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
  Widget _title(BuildContext context) {
    return Container(
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
      height: ScreenUtil().setHeight(144),
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
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/home_green.png'),
                    backgroundColor: Colors.white,
                  ),
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
      height: ScreenUtil().setHeight(200),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[_title(context), _headPortrait()],
      ),
    );
  }
}
