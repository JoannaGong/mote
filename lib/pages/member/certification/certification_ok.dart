import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../../routers/application.dart';

@RoutePage()
class CertificationOk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text('', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(164), 0, ScreenUtil().setHeight(60)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/certificationok.png',
                width: ScreenUtil().setWidth(216),
                height: ScreenUtil().setWidth(216),
                fit: BoxFit.contain,
              ),
          )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
            child: Text('认证信息提交成功', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Color(0xFFFF5658), fontWeight: FontWeight.w500))
          ),
          Align(
            alignment: Alignment.center,
            child: Text('我们将在5个工作日内进行审核，请耐心等候', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(100)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(44)),
              gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
            ),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              shape: StadiumBorder(),
              color: Colors.transparent,
              elevation: 0,
              child: Text('返回首页', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),),
              onPressed: (){
                Application.router.navigateTo(context, "/member", transition: TransitionType.inFromRight);
              },
            ),
          )
        ])
      ),
    );
  }
}