import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'dart:async';

import '../../../provide/login.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var userInfo = Provide.value<LoginProvide>(context).userData.data.userInfo;
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
              onPressed: (){},
          )),
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: ScreenUtil().setHeight(32)),
              child: Container(
                width: ScreenUtil().setWidth(104),
                height: ScreenUtil().setWidth(104),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/2.png'), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(3))
                ),
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(margin: EdgeInsets.only(bottom: 8), child: Text('金闪闪', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(36)))),
              Container(child: Text('模特     ID: 87789909', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(28))))
            ])
          ]),
        ])
      );
  }
}