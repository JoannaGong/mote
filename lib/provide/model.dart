import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/model/modeListModel.dart';
import 'dart:convert';

class ModelProvide with ChangeNotifier {
  ModelListModel modeListData;
  List<ModelList> list;
  bool isEnd = false;

  //获取模特列表
  getmodelList(int pageIndex) async {
    if (isEnd) {
      return;
    }
    var formData = {'pageNum': pageIndex, 'roleName': 2};
    await requestGet('getmodelList', formData: formData).then((val) {
      modeListData = ModelListModel.fromJson(val);

      if (list != null) {
        list.addAll(modeListData.data.pageInfo.list);
      } else {
        print(1);
        list = modeListData.data.pageInfo.list;
      }
      isEnd = modeListData.data.pageInfo.isLastPage;
      notifyListeners();
    });
  }
}
