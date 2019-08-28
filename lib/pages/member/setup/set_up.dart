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

class SetUp extends StatefulWidget {
  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> with AutomaticKeepAliveClientMixin {
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
      appBar: AppBar(title: Text('设置', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
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
                    aboutUs(),    // 关于我们 联系我们
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

  // 关于我们 联系我们
  Column aboutUs(){
    return Column(children: <Widget>[
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Application.router.navigateTo(context, "/aboutUs", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('关于我们', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )))
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
              Application.router.navigateTo(context, "/contactUs", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('联系我们', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: ScreenUtil().setSp(44),
              )))
          ]))
      ])),
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Application.router.navigateTo(context, "/accountSafe", transition: TransitionType.inFromRight);
            },
            child: Row(children: <Widget>[
              Text('账户安全', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
              Expanded(child:Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: ScreenUtil().setSp(44),
              )))
          ]))
      ])),
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(120)),
        child: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print('hhh');
            },
            child: Center(
              child: Text('退出登录', style: TextStyle(fontSize: ScreenUtil().setSp(32)))
          ))
      ]))
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

