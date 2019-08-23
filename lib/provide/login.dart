import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model_data/login/login_in.dart';

class LoginProvide with ChangeNotifier {
  LoginByPhone loginData = null;
  var token;

  // 获取手机验证码
  getPhoneValid(String phoneNumber) async {
    var formData = {'phoneNumber': phoneNumber};
    await requestGet('getPhoneValid', formData: formData).then((val) {
      print(val);
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
      loginData = LoginByPhone.fromJson(val);
      print(val['data']['token']);
      notifyListeners();
    });
  }
}
