import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../../routers/application.dart';
import '../../../provide/login.dart';
import '../setup/set_up.dart';

var userInfo;
var identity;

@RoutePage()
class UserInfo extends StatelessWidget {

  const UserInfo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(Provide?.value<LoginProvide>(context)?.userData?.data != null){
      userInfo = Provide.value<LoginProvide>(context).userData.data.userInfo;
      if(userInfo.roleName == 0){
        identity = '未认证用户';
      }else if(userInfo.roleName == 1){
        identity = '模特';
      }else if(userInfo.roleName == 2){
        identity = '经纪公司';
      }else if(userInfo.roleName == 3){
        identity = '商户';
      }else if(userInfo.roleName == 4){
        identity = '其他职业(摄影师化妆师等)';
      }
    }
    return Container(
        height: ScreenUtil().setHeight(460),
        width: ScreenUtil().setWidth(750),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))),
        child:Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(674), 20, 0, 0),
            child: IconButton(
              icon: Image.asset('assets/images/settings.png'),
              onPressed: (){
                Application.router.navigateTo(context, "/setup", transition: TransitionType.inFromRight);
              },
          )),
          GestureDetector(
            onTap: (){
              Application.router.navigateTo(context, "/setUserInfo", transition: TransitionType.inFromRight);
            },
            child:Row(children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: ScreenUtil().setHeight(32)),
                child: Container(
                  width: ScreenUtil().setWidth(104),
                  height: ScreenUtil().setWidth(104),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('${userInfo.headUrl}'), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(3))
                  ),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Container(margin: EdgeInsets.only(bottom: 8), child: Text('${userInfo.name}', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(36)))),
                Container(child: Text('$identity', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(28))))
              ])
            ]), 
          )
          
        ])
      );
  }
}