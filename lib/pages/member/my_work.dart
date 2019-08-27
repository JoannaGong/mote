import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWork extends StatelessWidget {
  const MyWork({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(228),
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
          ListTile(
            title: Text('我的作品', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/wendang.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            dense: true,
            isThreeLine: false,
          ),
          ListTile(
            title: Text('我的经纪公司（模特）', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/gongsiguanli.png'),
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