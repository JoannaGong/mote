import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import '../../provide/login.dart';
import 'package:provide/provide.dart';
import 'dart:async';

Dio dio = new Dio();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var phone;
  var validate;
  int isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: ListView(children: <Widget>[ Form(
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
              Container(
                width: ScreenUtil().setWidth(400),
                child: TextFormField(
                  onSaved: (String value) => validate = value,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return '请输入验证码';
                  //   }
                  // },
                  decoration: InputDecoration(
                    labelText: '请输入验证码',
                    labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32.0),color: Color(0xFF999999))
              ))),
              Container(
                width: ScreenUtil().setWidth(200),
                margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                child: RaisedButton(
                  child: Text('获取验证码',style: TextStyle(color: Color(0xFF999999))),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 11),
                  shape: StadiumBorder(side: BorderSide(color: Color(0xFFE2E2E2),width: ScreenUtil().setWidth(2))),
                  color: Color(0xFFFFFFFF),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Provide.value<LoginProvide>(context).getPhoneValid(phone);
                    }
              }))
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 100),
              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: RaisedButton(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Color(0xFFFF5658),
                splashColor: Color(0xFFFF5658),
                child: Text('登录', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white),),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print('phone:$phone , phoneValid:$validate');
                    Provide.value<LoginProvide>(context).loginByPhone(phone, validate);
                    // var token = Provide.value<LoginProvide>(context).token;
                    // print('token: $token');
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
      )])
    );
  }
}
