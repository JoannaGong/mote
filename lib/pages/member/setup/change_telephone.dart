import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:mote/pages/common/appbar.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../provide/login.dart';
import '../../../routers/application.dart';
import '../../common/toast.dart';

class ChangeTelephone extends StatefulWidget {
  @override
  _ChangeTelephoneState createState() => _ChangeTelephoneState();
}

class _ChangeTelephoneState extends State<ChangeTelephone> {
   final _formKey = GlobalKey<FormState>();
  var phone;
  var validate;
  var token;

  @override
  Widget build(BuildContext context) {
    // save() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString(token, Provide.value<LoginProvide>(context).token);
    // }
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: Text('', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(62)),
              child: Text('更换手机号', style: TextStyle(fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(60)),
              child: Column(children: <Widget>[
                Align(alignment: Alignment.centerLeft, child: Text('更换手机后，下次登陆可使用新的手机号登陆', style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Color(0xFF999999), height: ScreenUtil().setHeight(3)))),
                Align(alignment: Alignment.centerLeft, child: Text('当前手机号码：18827667822', style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Color(0xFF999999), height: ScreenUtil().setHeight(3)))),
              ])
            ),
            Text('输入需要绑定的手机号', style: TextStyle(fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w500)),
            inputTelephone(),
            inputValid(),
            click(),
        ]),
      ),
    );
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, Provide.value<LoginProvide>(context).token);
  }

  TextFormField inputTelephone(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: '请输入手机号',
        labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32.0), color: Color(0xFF999999)),
      ),
      validator: (String value) {
        var phoneReg = RegExp(
            r"(((13[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[3-8]{1})|(18[0-9]{1})|(19[0-9]{1})|(14[5-7]{1}))+\d{8})");
        if (!phoneReg.hasMatch(value)) {
          return '请输入正确的手机号';
        }
      },
      onSaved: (String value) => phone = value,
    );
  }

  Row inputValid(){
    return Row(children: <Widget>[
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
    ]);
  }

  Container click(){
    return Container(
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
        child: Text('完成', style: TextStyle(fontSize: ScreenUtil().setSp(34), color: Colors.white),),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            save();
            // 链式请求
            Future(() =>
              Provide.value<LoginProvide>(context).loginByPhone(phone, validate)  // 用手机登录app
            ).then((val){
              token = Provide.value<LoginProvide>(context).token;
              print('token1---$token');
            }).then((val){
              if(token != null){
                save();
                print('token2---$token');
                Provide.value<LoginProvide>(context).getUserInfo(token); // 请求用户数据
              }
            }).whenComplete(() => 
              Application.router.navigateTo(context, "/changeFinish", transition: TransitionType.inFromRight)
            );
          }
        },
    ));
  }

}