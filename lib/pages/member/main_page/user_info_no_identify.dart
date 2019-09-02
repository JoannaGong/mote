import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:fluro/fluro.dart';

import '../../../routers/application.dart';
import '../../../provide/login.dart';
import '../setup/set_up.dart';
import '../../../main.route.dart';

var userInfo;
var identity;

class UserInfoNoIdentify extends StatelessWidget {

  const UserInfoNoIdentify({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(Provide?.value<LoginProvide>(context)?.userData?.data != null){
      userInfo = Provide.value<LoginProvide>(context).userData.data.userInfo;
      if(userInfo.roleName == 1){
        identity = '未认证用户';
      }else if(userInfo.roleName == 2){
        identity = '模特';
      }else if(userInfo.roleName == 3){
        identity = '经纪公司';
      }else if(userInfo.roleName == 4){
        identity = '商户';
      }else if(userInfo.roleName == 5){
        identity = '其他职业(摄影师化妆师等)';
      }
    }
    return Container(
        height: ScreenUtil().setHeight(460),
        width: ScreenUtil().setWidth(750),
        color: Color(0xFFFFFFFF),
        child:Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(674), 30, 0, 0),
            child: IconButton(
              icon: Image.asset('assets/images/setting_black.png'),
              onPressed: (){
                Navigator.of(context).pushNamed(ROUTE_SET_UP);
              },
          )),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ROUTE_SET_USER_INFO);
            },
            child:Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB( 16, ScreenUtil().setHeight(20), 16, ScreenUtil().setHeight(32)),
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
                Container(margin: EdgeInsets.only(bottom: 8), child: Text('${userInfo.name}', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(36)))),
                Container(child: Text('$identity', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28))))
              ])
            ]), 
          )
        ])
      );
  }
}