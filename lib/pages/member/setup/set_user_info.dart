import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

import '../../../routers/application.dart';
import '../../../provide/login.dart';

var userInfo;
var areaInfo;

class SetUserInfo extends StatefulWidget {
  @override
  _SetUserInfoState createState() => _SetUserInfoState();
}

class _SetUserInfoState extends State<SetUserInfo> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  var sex;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text('个人信息', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      body: Container(
        child: FutureBuilder(
          future: _setupInfo(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Provide<LoginProvide>(builder: (context, child, val) {
                areaInfo = Provide.value<LoginProvide>(context).areaInfo;
                userInfo = Provide.value<LoginProvide>(context).userInfo;
                if(userInfo.certificationSex == 0){
                  sex = '男';
                }else if(userInfo.certificationSex == 1){
                  sex = '女';
                }else if(userInfo.certificationSex == 2 || userInfo.certificationSex == null){
                  sex = '未知';
                }
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
              );});
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
                image: DecorationImage(image: NetworkImage('${userInfo.headUrl}'), fit: BoxFit.cover),
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
                child: Text('${userInfo.name}', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
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
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('男', textAlign: TextAlign.center),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      onTap: (){
                        setState(() {
                          userInfo.certificationSex = 0;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text('女', textAlign: TextAlign.center),
                      onTap: (){
                        setState(() {
                          userInfo.certificationSex = 1;
                        });
                        Navigator.pop(context);
                      },
                    )
                ]);
              }
            );
          },
          child: Row(children: <Widget>[
            Text('性别', style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
            Expanded(child: Align(
              alignment: Alignment.centerRight,
              child: Text('$sex', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
            )),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
              size: ScreenUtil().setSp(44),
            ),
      ]))),
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
                child: Text('${areaInfo.name}', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32)),)    
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
      // await Provide.value<SettingProvide>(context).getAreaList(); //获取地区列表
      return '完成加载';
    });
  }

  void _refresh(BuildContext context) async {
    // var isShoot = Provide.value<HomeProvide>(context).isShoot ? 0 : 1;
    // Provide.value<HomeProvide>(context).pageNum = 1;
    // var token = Provide.value<LoginProvide>(context).token;
    // await Provide.value<SettingProvide>(context).getAreaList(); //获取地区列表
  }

}

