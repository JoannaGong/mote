import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/src/async_memoizer.dart';
import 'dart:async';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

import '../../provide/login.dart';
import './user_info.dart';
import './announce_manage.dart';
import './my_money.dart';
import './my_work.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key key}) : super(key: key);
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // var userInfo = Provide.value<LoginProvide>(context).userData;
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getMemberInfo(context),
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
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(825)),
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Container(color: Color(0xFFF5F5F5),),
                          Positioned(
                            top: 0,
                            child:UserInfo(),     // 用户信息
                          ),
                          AnnounceManage(),  // 通告管理
                      ])),
                    MyMoney(),  // 我的钱包、收藏、主页、佣金管理
                    MyWork(),  // 我的作品、经纪公司（模特）
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

  Future<String> get() async {
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(token);
    return token;
  }

  Future _getMemberInfo(BuildContext context) async {
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