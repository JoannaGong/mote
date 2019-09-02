import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_annotation/route_annotation.dart';

@RoutePage()
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('关于我们', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFFFFFFF),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(84), 0, ScreenUtil().setHeight(120)),
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setWidth(200),
                fit: BoxFit.cover,
                image: NetworkImage('https://hbimg.huabanimg.com/c654f298c00f3d54a6488be1774b3ba64b2d1c34256b9-MEwj6x_fw658'),
              ),
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
            child: Text(
              '1、汇聚全国各地海量专业摄影师、模特、化妆师及摄影基地、影视城信息；',
              style: TextStyle(fontSize: ScreenUtil().setSp(28), height: ScreenUtil().setHeight(2.8)),
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
            child: Text(
              '2、每日持续更新大量专业信息资源、如摄影师、模特、化妆师、及相关作品；',
              style: TextStyle(fontSize: ScreenUtil().setSp(28), height: ScreenUtil().setHeight(2.8)),
          ))
        ],),
      ),
    );
  }
}