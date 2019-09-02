import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../../routers/application.dart';


@RoutePage()
class CertificationCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(title: Text('经纪认证', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      // backgroundColor: Color(0xFFFFFFFF),
      body: Form(child: Column(children: <Widget>[
        Container(
          color: Color(0xFFF5F5F5),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
          color: Color(0xFFFFFFFF),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
              child:Align(alignment: Alignment.centerLeft, child: Text('企业名称', style: TextStyle(fontSize: ScreenUtil().setSp(32))))
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请填写',
                labelStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(32.0),
                    color: Color(0xFF999999))
              ),
              // onSaved: (String value) => phone = value,
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
              child:Align(alignment: Alignment.centerLeft, child: Text('组织机构代码', style: TextStyle(fontSize: ScreenUtil().setSp(32))))
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请填写',
                labelStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(32.0),
                    color: Color(0xFF999999))
              ),
              // onSaved: (String value) => phone = value,
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
              child:Align(alignment: Alignment.centerLeft, child: Text('认证信息', style: TextStyle(fontSize: ScreenUtil().setSp(32))))
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '示例：阿卡有限公司',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0),
                  color: Color(0xFF999999))
              ),
              // onSaved: (String value) => phone = value,
            ),
          ]),
        ),
        Container(
          color: Color(0xFFF5F5F5),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
          height: ScreenUtil().setHeight(683),
          color: Color(0xFFFFFFFF),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(32)),
              child:Align(alignment: Alignment.centerLeft, child: Text('上传认证图片', style: TextStyle(fontSize: ScreenUtil().setSp(32))))
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请填写',
                labelStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0),
                  color: Color(0xFF999999))
              ),
              // onSaved: (String value) => phone = value,
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(254)),
              width: ScreenUtil().setWidth(686),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(44)),
                gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
              ),
              child: RaisedButton(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.transparent,
                elevation: 0,
                child: Text('下一步', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white),),
                onPressed: () {
                  print('hhh');
                }
              )
            )
          ])
        )
      ]))
    );
  }
}