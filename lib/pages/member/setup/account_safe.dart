import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';

import '../../../routers/application.dart';

class AccountSafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(children: <Widget>[
        Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          child: Row(children: <Widget>[
            Text('账户ID', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
            Expanded(child:Align(
              alignment: Alignment.centerRight,
              child: Text('0575-98544456', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
            ))
          ])
        ),
        Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          child: GestureDetector(
            onTap: (){
              Application.router.navigateTo(context, "/activity", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('手机号', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Text('0575-98544456', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )
          ])
        )
      ]))
    );
  }
}