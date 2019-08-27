import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoIdentify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(28), vertical: ScreenUtil().setHeight(40)),
      child: Column(children: <Widget>[
        Container(alignment: Alignment.centerLeft, child: Text('认证之后才可开通附加功能', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Color(0xFF333333)))),
        Container(
          height: ScreenUtil().setHeight(162),
          width: ScreenUtil().setWidth(694),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12))),
            gradient: LinearGradient(colors: [Color(0xFF00AEEF), Color(0xFF9FFFDA)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(15)),
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(children: <Widget>[
            Expanded(child: Container(alignment: Alignment.centerLeft, child: Text('认证商家', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white)))),
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text('附加功能：发布通告、定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.white)))
            )
          ])
        ),
        Container(
          height: ScreenUtil().setHeight(162),
          width: ScreenUtil().setWidth(694),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12))),
            gradient: LinearGradient(colors: [Color(0xFFFF3D3D), Color(0xFFFFC28C)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(15)),
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(children: <Widget>[
            Expanded(child: Container(alignment: Alignment.centerLeft, child: Text('认证艺人', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white)))),
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text('附加功能：申请通告、定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.white)))
            )
          ])
        ),
        Container(
          height: ScreenUtil().setHeight(162),
          width: ScreenUtil().setWidth(694),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12))),
            gradient: LinearGradient(colors: [Color(0xFFDA83E9), Color(0xFF6B5BFE)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(15)),
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(children: <Widget>[
            Expanded(child: Container(alignment: Alignment.centerLeft, child: Text('认证经纪', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white)))),
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text('附加功能：申请通告、管理模特', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.white)))
            )
          ])
        ),
        Container(
          height: ScreenUtil().setHeight(162),
          width: ScreenUtil().setWidth(694),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12))),
            gradient: LinearGradient(colors: [Color(0xFFFF7B0F), Color(0xFFFFDF6B)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(15)),
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(children: <Widget>[
            Expanded(child: Container(alignment: Alignment.centerLeft, child: Text('认证其他职业', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white)))),
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text('附加功能：申请通告、发布作品、发布通告', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.white)))
            )
          ])
        )
      ]),
    );
  }
}