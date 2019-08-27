import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model_data/login/login_in.dart';
import '../model_data/login/user_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvide with ChangeNotifier {
  LoginByPhone loginData = null;
  GetUserInfo userData = null;
  var token;

  // 获取手机验证码
  getPhoneValid(String phoneNumber) async {
    var formData = {'phoneNumber': phoneNumber};
    await requestGet('getPhoneValid', formData: formData).then((val) {
      // print(val);
      if(val['code'] == 101){
        toast('验证码发送成功');
      }else{
        toast(val['data']['error']);
      }
      notifyListeners();
    });
  }

  // 手机验证码注册/登录
  loginByPhone(String phone, var phoneCode) async {
    var formData = {
      'phone': phone,
      'phoneCode': phoneCode
    };
    await requestPost('loginForPhone', formData: formData).then((val){
      // print(val);
      loginData = LoginByPhone.fromJson(val);
      if(val['code'] == 101){
        token = val['data']['token'];
      }else{
        toast(val['data']['msg']);
      }
      notifyListeners();
    });
  }

  // 获取用户信息
  getUserInfo(String token) async {
    await requestPost('getUserInfo', token: token).then((val){
      userData = GetUserInfo.fromJson(val);
      print(val);
      notifyListeners();
    });
  }

  toast(String toast) {
    Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0
    );
  }
}
