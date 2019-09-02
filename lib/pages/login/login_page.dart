import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:route_annotation/route_annotation.dart';
import 'dart:async';

import '../member/member_page.dart';
import '../common/toast.dart';
import '../../main.route.dart';
import '../../provide/main.dart';
import '../../provide/login.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var phone;
  var validate;
  var token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        // leading: Builder(builder: (BuildContext context){
        //   return IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     onPressed: (){
        //       Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomePage())
        //       );
        //     },
        //   );
        // }),
        backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 60),
              child: Text(
                '欢迎来到艺拍APP',
                style: TextStyle(fontSize: ScreenUtil().setSp(48.0), fontWeight: FontWeight.w500),
              ),
            ),
            Text('快捷登录/注册',
                style: TextStyle(fontSize: ScreenUtil().setSp(34.0), fontWeight: FontWeight.w500)),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入手机号',
                labelStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(32.0),
                    color: Color(0xFF999999))),
              validator: (String value) {
                var phoneReg = RegExp(
                    r"(((13[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[3-8]{1})|(18[0-9]{1})|(19[0-9]{1})|(14[5-7]{1}))+\d{8})");
                if (!phoneReg.hasMatch(value)) {
                  return '请输入正确的手机号';
                }
              },
              onSaved: (String value) => phone = value,
            ),
            Row(children: <Widget>[
              Expanded(child: Container(
                width: ScreenUtil().setWidth(410),
                child: TextFormField(
                  onSaved: (String value) => validate = value,
                  decoration: InputDecoration(
                    labelText: '请输入验证码',
                    labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32.0),color: Color(0xFF999999))
              )))),
              Expanded(child: Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60), ScreenUtil().setHeight(50), 0, ScreenUtil().setHeight(8)),
                child: RaisedButton(
                  child: Text('获取验证码',style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(32))),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: ScreenUtil().setWidth(22)),
                  shape: StadiumBorder(side: BorderSide(color: Color(0xFFE2E2E2),width: ScreenUtil().setWidth(2))),
                  color: Color(0xFFFFFFFF),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Provide.value<LoginProvide>(context).getPhoneValid(phone);
                    }
              })))
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(44)),
                gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))
              ),
              child: RaisedButton(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.transparent,
                elevation: 0,
                child: Text('登录', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white),),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    
                    // 链式请求
                    Future(() =>
                      Provide.value<LoginProvide>(context).loginByPhone(phone, validate)  // 用手机登录app
                    ).then((val){
                      token = Provide.value<LoginProvide>(context).token;
                      Provide.value<MainProvide>(context).saveToken(token);
                      Provide.value<MainProvide>(context).changeToken(token);
                    }).then((val){
                      if(token != null){
                        Provide.value<MainProvide>(context).saveToken(token);
                        Navigator.of(context).pushNamed(ROUTE_MEMBER_PAGE);
                        // ROUTE_HOME
                        // Navigator.pop(
                        //   context, MaterialPageRoute(builder: (context) => MemberPage())
                        // );
                      }
                    }).then((val){
                      Provide.value<LoginProvide>(context).getUserInfo(); // 请求用户数据
                    });
                  }
                },
            )),
            Align(child:
              Text('其他登录方式', style: TextStyle(fontSize: ScreenUtil().setSp(26), color: Color(0xFF999999))),
              alignment: Alignment.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child:Row(children: <Widget>[
                Expanded(child: Container(
                  child:IconButton(
                    icon: Image.asset('assets/images/zhifubao.png'),
                    iconSize: ScreenUtil().setSp(72),
                    onPressed: (){},
                ))),
                Expanded(child: Container(child: 
                  IconButton(
                    icon: Image.asset('assets/images/weibo.png'),
                    iconSize: ScreenUtil().setSp(72),
                    onPressed: (){},
                ))),
                Expanded(child: Container(child: 
                  IconButton(
                    icon: Image.asset('assets/images/QQ.png'),
                    iconSize: ScreenUtil().setSp(72),
                    onPressed: (){},
                ))),
                Expanded(child: Container(child: 
                  IconButton(
                    icon: Image.asset('assets/images/wechat.png'),
                    iconSize: ScreenUtil().setSp(72),
                    onPressed: (){},
                )))
            ])),
            Align(child:
              Text.rich(TextSpan(children: [
                TextSpan(text: '登录代表您已同意', style: TextStyle(color: Color(0xFF999999))),
                TextSpan(text: '《软件许可及使用协议》', style: TextStyle(color: Colors.blue))
              ])),
              alignment: Alignment.center,
            ),
          ],
        ),
      )
    );
  }
}
