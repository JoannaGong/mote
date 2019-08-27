import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoIdentify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text('认证之后才可开通附加功能', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Color(0xFF333333))),
        
      ],),
    );
  }
}