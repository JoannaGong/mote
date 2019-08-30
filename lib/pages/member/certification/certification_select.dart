import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routers/application.dart';

class CertificationSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('绑定手机号', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(62)),
        child: Column(children: <Widget>[
          
        ]),
      ),      
    );
  }
}