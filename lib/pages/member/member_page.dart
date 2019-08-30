import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/member/main_page/announce_manage_merchant.dart';
import 'package:mote/pages/member/main_page/no_identify.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/src/async_memoizer.dart';
import 'dart:async';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

import '../../provide/login.dart';
import './main_page/user_info.dart';
import './main_page/announce_manage.dart';
import './main_page/announce_manage_merchant.dart';
import './main_page/my_money.dart';
import './main_page/my_work.dart';
import './main_page/my_money_merchant.dart';
import './main_page/no_identify.dart';
import './main_page/user_info_no_identify.dart';

var userInfo;
var token;

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
    // if(Provide?.value<LoginProvide>(context)?.userData?.data != null){
    //   userInfo = Provide.value<LoginProvide>(context).userData.data.userInfo;
    // }
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F5F5),
        child: FutureBuilder(
          future: _getMemberInfo(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Provide<LoginProvide>(builder: (context, child, val){
                token = Provide.value<LoginProvide>(context).token;
                print('member_page: $token');
                Provide.value<LoginProvide>(context).getUserInfo(token);
                userInfo = Provide.value<LoginProvide>(context).userInfo;
                if(userInfo?.roleName == 1){   // 未认证用户
                  return  Container(
                    child: EasyRefresh(
                      header: BallPulseHeader(color: Color(0xFFFF5658)),
                      onRefresh: () async {
                        _refresh(context);
                      },
                      child: ListView(children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(396)),  // 无身份
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(color: Color(0xFFF5F5F5),),
                              Positioned(
                                top: 0,
                                child: UserInfoNoIdentify(),     // 用户信息
                              ),
                          ])),
                        NoIdentify(),  // 无身份 认证信息
                      ])
                    )
                  );
                }else if(userInfo?.roleName == 2 || userInfo?.roleName == 3){   // 模特经纪
                  return  Container(
                    child: EasyRefresh(
                      header: BallPulseHeader(color: Color(0xFFFF5658)),
                      onRefresh: () async {
                        _refresh(context);
                      },
                      child: ListView(children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(825)),  // 模特、商户
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(color: Color(0xFFF5F5F5)),
                              Positioned(
                                top: 0,
                                child:UserInfo(),     // 用户信息
                              ),
                              AnnounceManage(),  // 通告管理
                          ])),
                        MyMoneyMerchant(),  // 商户 -- 我的钱包、收藏、专业服务、通告统计、付费作品
                      ])
                    )
                  );
                }else if(userInfo?.roleName == 4){   // 商户
                  return  Container(
                    child: EasyRefresh(
                      header: BallPulseHeader(color: Color(0xFFFF5658)),
                      onRefresh: () async {
                        _refresh(context);
                      },
                      child: ListView(children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(825)),  // 模特、商户
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(color: Color(0xFFF5F5F5),),
                              Positioned(
                                top: 0,
                                child:UserInfo(),     // 用户信息
                              ),
                              AnnounceManageMerchant(),  // 通告管理
                          ])),
                        MyMoney(),  //  我的钱包、收藏、主页、佣金管理
                        MyWork(),  // 我的作品、经纪公司（模特）
                      ])
                    )
                  );
                }else if(userInfo?.roleName == 5){   // 其他职业  // 待完善
                  return  Container(
                    child: EasyRefresh(
                      header: BallPulseHeader(color: Color(0xFFFF5658)),
                      onRefresh: () async {
                        _refresh(context);
                      },
                      child: ListView(children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(825)), 
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(color: Color(0xFFF5F5F5)),
                              Positioned(
                                top: 0,
                                child:UserInfo(),     // 用户信息
                              ),
                              AnnounceManage(),  // 通告管理
                          ])),
                        MyMoneyMerchant(),
                      ])
                    )
                  );
                }else{
                  return Container();
                }
              });
            }else{
              return Container();
            }
          }
        ) 
      )
    );
  }

  Future _getMemberInfo(BuildContext context) async {
    return _memoizer.runOnce(() async {
      // var token = Provide.value<LoginProvide>(context).token;
      // await Provide.value<LoginProvide>(context).getUserInfo(token); // 获取用户信息
      return '完成加载';
    });
  }

  void _refresh(BuildContext context) async {
    // var token = Provide.value<LoginProvide>(context).token;
    // await Provide.value<LoginProvide>(context).getUserInfo(token); // 获取地区列表
  }
}