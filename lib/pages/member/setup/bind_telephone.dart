import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';

import '../../../routers/application.dart';

class BindTelephone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('绑定手机号', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(84), 0, ScreenUtil().setHeight(120)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('../../../../assets/images/shouji.png',
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setWidth(240),
                fit: BoxFit.contain,
              ),
          ))
        ])
      ),
    );
  }
}