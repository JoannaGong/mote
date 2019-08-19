import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/homeModel.dart';
import 'dart:convert';

class HomeProvide with ChangeNotifier{
  DetailsModel goodsInfo = null;

  getGoodsInfo(String id){
    var formData = {'goodId': id};
    request('getGoodDetailById', formData: formData).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}