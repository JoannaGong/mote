import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/home/bannerModel.dart';
import 'dart:convert';

class HomeProvide with ChangeNotifier{
  BannerModel bannerData = null; //banner
  bool isShoot = true;  //是否摄影
  bool isModel = true;  //是否模特

  //获取banner列表
  getBannerList() async{
   await requestGet('bannerForAjax').then((val){
      bannerData = BannerModel.fromJson(val);
      // print(val);
      notifyListeners();
    });
  }

  //切换摄影、化妆
  changeShoot(bool type){
    isShoot = type;
    notifyListeners();
  }

  //切换摄影、化妆
  changeModel(bool type){
    isModel = type;
    notifyListeners();
  }
}