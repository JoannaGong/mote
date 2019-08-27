import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMoney extends StatelessWidget {
  const MyMoney({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(458),
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(40)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
          ListTile(
            title: Text('我的钱包', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/qianbao.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            dense: true,
            isThreeLine: false,
          ),
          ListTile(
            title: Text('我的收藏', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/shoucang-3.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          ),
          ListTile(
            title: Text('我的主页', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/zhuye-xuanzhong.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          ),
          ListTile(
            title: Text('我的佣金管理（经纪）', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/jine.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          )
        ]),
    );
  }
}