import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';

import '../model_data/home/banner_model.dart';
import '../model_data/home/navigator_model.dart';

class HomeProvide with ChangeNotifier {
  BannerModel bannerData = null; //banner
  NavigatorModel navigatorData = null; //navigator

  bool isShoot = true; //是否摄影
  bool isModel = true; //是否模特

  //切换摄影、化妆
  changeShoot(bool type) {
    isShoot = type;
    notifyListeners();
  }

  //切换摄影、化妆
  changeModel(bool type) {
    isModel = type;
    notifyListeners();
  }

  //获取banner列表
  getBannerList() async {
    await requestGet('bannerForAjax').then((val) {
      bannerData = BannerModel.fromJson(val);
      notifyListeners();
    });
  }

  //获取navigator列表
  getNavigatorList() async {
    await requestGet('homeModuleForAjax').then((val) {
      navigatorData = NavigatorModel.fromJson(val);
      notifyListeners();
    });
  }
}
