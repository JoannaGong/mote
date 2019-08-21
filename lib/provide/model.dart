import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/model/modeListModel.dart';
import 'dart:convert';

class ModelProvide with ChangeNotifier {
  ModelListModel modeListData;

  //获取模特列表
  getmodelList(params) async {
    FormData formData = FormData.from(params);
    await requestGet('getmodelList', formData: formData).then((val) {
      modeListData = ModelListModel.fromJson(val);
      print(val);
      notifyListeners();
    });
  }
}
