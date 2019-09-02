import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../../routers/application.dart';

@RoutePage()
class CertificationModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('艺人认证', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: (){
              Application.router.navigateTo(context, "/model", transition: TransitionType.inFromRight);
            },
            child: Container(
              child: Image.asset(
                'assets/images/female2.png',
                width: ScreenUtil().setWidth(702),
                height: ScreenUtil().setWidth(158),
                fit: BoxFit.fill,
            )),
          ),
          GestureDetector(
            onTap: (){
              Application.router.navigateTo(context, "/changeTelephone", transition: TransitionType.inFromRight);
            },
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Image.asset(
                'assets/images/male.png',
                width: ScreenUtil().setWidth(702),
                height: ScreenUtil().setWidth(158),
                fit: BoxFit.fill,
            )),
          ),
          GestureDetector(
            onTap: (){
              Application.router.navigateTo(context, "/changeTelephone", transition: TransitionType.inFromRight);
            },
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Image.asset(
                'assets/images/child.png',
                width: ScreenUtil().setWidth(702),
                height: ScreenUtil().setWidth(158),
                fit: BoxFit.fill,
            )),
          ),
        ]),
      ),      
    );
  }
}