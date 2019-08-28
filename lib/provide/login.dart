import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/service_method.dart';
import '../model_data/login/login_in.dart';
import '../model_data/login/user_info.dart';
import '../pages/common/toast.dart';


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
        showToast('验证码发送成功');
      }else{
        showToast(val['data']['error']);
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
        showToast(val['data']['msg']);
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
}
