import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../routers/application.dart';
import '../../../provide/login.dart';
import '../../../provide/main.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();

class AccountSafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(child: FutureBuilder(
        future: _changeTel(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Provide<LoginProvide>(builder: (context, child, val){
              var userInfo = Provide.value<LoginProvide>(context).userInfo;
              return  Container(
                color: Color(0xFFF5F5F5),
                child: EasyRefresh(
                  header: BallPulseHeader(color: Color(0xFFFF5658)),
                  footer: BallPulseFooter(color: Color(0xFFFF5658)),
                  onRefresh: () async {
                    _changeTel(context);
                  },
                  onLoad: () async {
                    _changeTelephone(context);
                  },
                child: ListView(children: <Widget>[
                Container(
                  color: Color(0xFFFFFFFF),
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Row(children: <Widget>[
                    Text('账户ID', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                    Expanded(child:Align(
                      alignment: Alignment.centerRight,
                      child: Text('${userInfo.id}', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
                    ))
                  ])
                ),
                Container(
                  color: Color(0xFFFFFFFF),
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(32)),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Application.router.navigateTo(context, "/bindTelephone", transition: TransitionType.inFromRight);
                    },
                    child: Row(children: <Widget>[
                      Text('手机号', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                      Expanded(child:Align(
                        alignment: Alignment.centerRight,
                        child: Text('${userInfo.phone}', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)))
                      )),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: ScreenUtil().setSp(44),
                      )
                  ]))
                )
              ])));
          });}else{
            return Container();
          }
        }
      ))
    );
  }

  Future _changeTel(BuildContext context) async {    
    return _memoizer.runOnce(() async {
      // await Provide.value<LoginProvide>(context).getAreaList(); // 获取地区列表
      return '完成加载';
    });
  }

  Future _changeTelephone(BuildContext context) async {
    // await Provide.value<LoginProvide>(context).getAreaList(); // 获取地区列表
    return '完成加载';
  }

}