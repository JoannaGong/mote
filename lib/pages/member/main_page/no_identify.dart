import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoIdentify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24), vertical: ScreenUtil().setHeight(40)),
      child: Column(children: <Widget>[
        Container(alignment: Alignment.centerLeft, child: Text('认证之后才可开通附加功能', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Color(0xFF333333)))),
        GestureDetector(
          onTap: (){
            print('hhh');
          },
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Image.asset(
              'assets/images/merchant.png',
              width: ScreenUtil().setWidth(702),
              height: ScreenUtil().setWidth(158),
              fit: BoxFit.fill,
          )),
        ),
        GestureDetector(
          onTap: (){
            print('hhh');
          },
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Image.asset(
              'assets/images/star.png',
              width: ScreenUtil().setWidth(702),
              height: ScreenUtil().setWidth(158),
              fit: BoxFit.fill,
          )),
        ),
        GestureDetector(
          onTap: (){
            print('hhh');
          },
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Image.asset(
              'assets/images/jingji.png',
              width: ScreenUtil().setWidth(702),
              height: ScreenUtil().setWidth(158),
              fit: BoxFit.fill,
          )),
        ),
        GestureDetector(
          onTap: (){
            print('hhh');
          },
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Image.asset(
              'assets/images/other.png',
              width: ScreenUtil().setWidth(702),
              height: ScreenUtil().setWidth(158),
              fit: BoxFit.fill,
          )),
        ),
      ]),
    );
  }
}