import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../service/service_method.dart';
import '../model_data/login/login_in.dart';
import '../model_data/login/user_info.dart';
import '../pages/common/toast.dart';
import '../model_data/setting/area_list.dart';
import '../model_data/setting/change_phone.dart';

class LoginProvide with ChangeNotifier {
  LoginByPhone loginData;
  GetUserInfo userData;
  GetAreaList areaData;
  List<AreaList> list;
  Area areaInfo;
  UserInfo userInfo;
  // List<Null> photos;
  // GetPhotoData photoData;
  // ChangePhoneData phoneData;
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
  getUserInfo() async {
    await requestPost('getUserInfo').then((val){
      // print(val);
      userData = GetUserInfo.fromJson(val);
      userInfo = userData.data.userInfo;
      areaInfo = userData.data.userInfo.area;
      notifyListeners();
    });
  }

  // 获取地区列表（不分页）
  getAreaList() async {
    await requestGet('areaList').then((val){
      // print(val);
      areaData = GetAreaList.fromJson(val);
      list = areaData.data.areaList;
      notifyListeners();
    });
  }

  // 更换手机号
  changedPhone(String id, String phone, String phoneCode) async {
    var formData = {
      'id': id,
      'phone': phone,
      'phoneCode': phoneCode
    };
    await requestPost('changePhone', formData: formData).then((val) {
      // phoneData = ChangePhoneData.fromJson(val);
      notifyListeners();
    });
  }

  // 用户相册列表
  photoList(String id) async {
    var formData = {
      'userId': id
    };
    await requestPost('photoForAjax', formData: formData).then((val){
      // photoData = GetPhotoData.fromJson(val);
      // photos = photoData.data.userPhotoAlbumList;
      notifyListeners();
    });
  }
}
