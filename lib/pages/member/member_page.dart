import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final _formKey = GlobalKey<FormState>();
  var phone;
  var validate;
  int isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 64, 0, 60),
              child: Text(
                '欢迎来到艺拍APP',
                style: TextStyle(fontSize: ScreenUtil().setSp(48.0)),
              ),
            ),
            Text('快捷登录/注册',
                style: TextStyle(fontSize: ScreenUtil().setSp(34.0))),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '请输入手机号',
                  labelStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(32.0),
                      color: Color(0xFF999999))),
              validator: (String value) {
                var phoneReg = RegExp(
                    r"^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$");
                if (!phoneReg.hasMatch(value)) {
                  return '请输入正确的手机号';
                }
              },
              onSaved: (String value) => phone = value,
            ),
            TextFormField(
              onSaved: (String value) => validate = value,
              validator: (String value) {
                if (value.isEmpty) {
                  return '请输入验证码';
                }
              },
              decoration: InputDecoration(
                  labelText: '请输入验证码',
                  labelStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(32.0),
                      color: Color(0xFF999999)),
                  suffixIcon: RaisedButton(
                    child: Text('获取验证码',
                        style: TextStyle(color: Color(0xFF999999))),
                    shape: StadiumBorder(
                        side: BorderSide(
                            color: Color(0xFFE2E2E2),
                            width: ScreenUtil().setWidth(2))),
                    color: Color(0xFFFFFFFF),
                    onPressed: () {
                      validPhoneNum();
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top:25),
              child: Text(
                '如果未注册，请直接点击注册按钮，进行注册',
                style: TextStyle(fontSize: ScreenUtil().setSp(30.0)),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 20, 0),
                    child: RaisedButton(
                      child: Text('登录'),
                      onPressed: () {},
                  )),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                    child: RaisedButton(
                      child: Text('注册'),
                      onPressed: () {},
                  )),
                  flex: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  validPhoneNum() async {
    var res = await dio.get(
        'http://101.37.156.106/model_api/sendMessageController/sendMessage?phoneNumber=$phone&type=0');
    print(res);
  }
}
