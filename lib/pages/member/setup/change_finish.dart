import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../member_page.dart';

class ChangeFinish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text('绑定手机号', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(164), 0, ScreenUtil().setHeight(60)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/changeTelephone.png',
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setWidth(200),
                fit: BoxFit.contain,
              ),
          )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
            child: Text('更换成功', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Color(0xFFFF5658)))
          ),
          Align(
            alignment: Alignment.center,
            child: Text('请使用新手机号进行登录', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(100)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(44)),
              gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
            ),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              shape: StadiumBorder(),
              color: Colors.transparent,
              elevation: 0,
              child: Text('我知道了', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(34)),),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MemberPage())
                );
              },
            ),
          )
        ])
      ),
    );
  }
}