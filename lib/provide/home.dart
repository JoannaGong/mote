import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';

import '../model_data/home/banner_model.dart';
import '../model_data/home/navigator_model.dart';
import '../model_data/model/modeListModel.dart';

class HomeProvide with ChangeNotifier {
  BannerModel bannerData = null; //banner
  NavigatorModel navigatorData = null; //navigator
  ModelListModel cameramanData = null; //摄影师
  ModelListModel modelData = null;  //模特

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
  getNavigatorList(int roleName) async {
    var formData = {'roleName': roleName};
    await requestGet('homeModuleForAjax', formData: formData).then((val) {
      navigatorData = NavigatorModel.fromJson(val);
      notifyListeners();
    });
  }

  //获取摄影师、化妆师
  getShootlList(int queryCertificationSonType) async {
    var formData = {
      'queryCertificationSonType': queryCertificationSonType,
      'roleName': 5,
      'recommendedFlag': 1,
      'pageNum': 1,
      'pageCount': 10,
      'buttonCount': 5,
      'sortBy': 'created_time',
      'orderBy': 'desc'
    };
    await requestGet('getmodelList', formData: formData).then((val) {
      // var responseData= json.decode(val.toString());
      cameramanData = ModelListModel.fromJson(val);
      // print(val);
      notifyListeners();
    });
  }

  //获取模特、经纪人
  getModelList(int roleName) async {
    var formData = {
      'roleName': roleName,
      'recommendedFlag': 1,
      'pageNum': 1,
      'pageCount': 10,
      'buttonCount': 5,
      'sortBy': 'created_time',
      'orderBy': 'desc'
    };
    await requestGet('getmodelList', formData: formData).then((val) {
      modelData = ModelListModel.fromJson(val);
      notifyListeners();
    });
  }
}
