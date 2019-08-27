import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoIdentify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(28), vertical: ScreenUtil().setHeight(40)),
      alignment: Alignment.centerLeft,
      child: Column(children: <Widget>[
        Text('认证之后才可开通附加功能', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Color(0xFF333333)), textAlign: TextAlign.left,),
        Container(
          height: ScreenUtil().setHeight(162),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9FFFDA), Color(0xFF00AEEF)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(20)),
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(children: <Widget>[
            Expanded(child: Text('认证商家', style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.white))),
            Expanded(child: Text('附加功能：发布通告、定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(20), color: Colors.white), textAlign: TextAlign.left,),)
          ],),
        )
      ],),
    );
  }
}