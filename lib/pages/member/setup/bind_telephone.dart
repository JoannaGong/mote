import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../../routers/application.dart';
import '../../../provide/login.dart';
import '../../../provide/main.dart';

@RoutePage()
class BindTelephone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userInfo = Provide.value<LoginProvide>(context).userInfo;
    return Scaffold(
      appBar: AppBar(title: Text('绑定手机号', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(164), 0, ScreenUtil().setHeight(60)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/shouji.png',
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setWidth(240),
                fit: BoxFit.contain,
              ),
          )),
          Align(
            alignment: Alignment.center,
            child: Text('你的手机号：${userInfo.phone}', style: TextStyle(fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w500)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(80)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(44)),
              gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
            ),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              shape: StadiumBorder(),
              color: Colors.transparent,
              elevation: 0,
              child: Text('更换手机号', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),),
              onPressed: (){
                Application.router.navigateTo(context, "/changeTelephone", transition: TransitionType.inFromRight);
              },
            ),
          )
        ])
      ),
    );
  }
}