import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('联系我们', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: ListView(children: <Widget>[
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Row(children: <Widget>[
              Text('电话', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Text('0575-98544456', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
              ))
            ])
          ),
          line(),
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
            child: Row(children: <Widget>[
              Text('商家客户电话我们', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Text('0575-98544456', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
              ))
            ])
          ),
          line(),
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
            child: Row(children: <Widget>[
              Text('艺人客服电话', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Text('0575-98544456', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
              ))
            ])
          ),
          line(),
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
            child: Row(children: <Widget>[
              Text('电子邮箱', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Text('Pance123@129.com', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
              ))
            ])
          ),
    ])));
  }

  Container line(){
    return Container(
      height: ScreenUtil().setHeight(2),
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      color: Color(0xFFE2E2E2),
    );
  }
}