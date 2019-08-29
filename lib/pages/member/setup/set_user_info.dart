import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

import '../../../routers/application.dart';

class SetUserInfo extends StatefulWidget {
  @override
  _SetUserInfoState createState() => _SetUserInfoState();
}

class _SetUserInfoState extends State<SetUserInfo> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text('个人信息', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        child: FutureBuilder(
          future: _setupInfo(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return  Container(
                child: EasyRefresh(
                  header: BallPulseHeader(color: Color(0xFFFF5658)),
                  onRefresh: () async {
                    _refresh(context);
                  },
                  child: 
                  ListView(children: <Widget>[
                    setAvatar(),   // 头像
                    setUserInfo(),  // 昵称、性别、地区
                  ])
                )
              );
            }else{
              return Container();
            }
          }
        )
      )
    );
  }

  // 头像
  Container setAvatar(){
    return Container(
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Application.router.navigateTo(context, "/activity", transition: TransitionType.inFromRight);
        },
        child: Row(children: <Widget>[
          Text('头像', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
          Expanded(child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(100),
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/2.png'), fit: BoxFit.cover),
                shape: BoxShape.circle,
              )
          ))),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(44),
          )
      ])),
    );
  }

  // 昵称、性别、地区
  Column setUserInfo(){
    return Column(children: <Widget>[
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Application.router.navigateTo(context, "/setName", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('昵称', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text('胡萝卜', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )
          ]))
      ])),
      line(),
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Application.router.navigateTo(context, "/setSex", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('性别', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text('女', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )
          ]))
      ])),
      line(),
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Application.router.navigateTo(context, "/setArea", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('地区', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text('新加坡', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )
          ]))
      ])),
    ]);
  }

  Container line(){
    return Container(
      height: ScreenUtil().setHeight(2),
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      color: Color(0xFFE2E2E2),
    );
  }

  Future _setupInfo(BuildContext context) async {
    return _memoizer.runOnce(() async {
      // Future<String> token = get();
      // await Provide.value<LoginProvide>(context).getUserInfo(token); //获取摄影师、化妆师
      return '完成加载';
    });
  }

  void _refresh(BuildContext context) async {
    // var isShoot = Provide.value<HomeProvide>(context).isShoot ? 0 : 1;
    // Provide.value<HomeProvide>(context).pageNum = 1;
    // var token = Provide.value<LoginProvide>(context).token;
    // await Provide.value<LoginProvide>(context).getUserInfo(token); //获取用户信息
  }

}

