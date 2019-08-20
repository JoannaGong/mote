import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/home/bannerModel.dart';
import 'dart:convert';

class HomeProvide with ChangeNotifier{
  BannerModel bannerData = null;

  getBannerList() async{
   await requestGet('bannerForAjax').then((val){
      bannerData = BannerModel.fromJson(val);
      print(val);
      notifyListeners();
    });
  }


}