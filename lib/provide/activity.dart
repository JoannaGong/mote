import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/activity/activity_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivityProvide with ChangeNotifier {
  ActivityModel activitydata;
  List<ActivityList> list=[];
  bool isEnd = false;
  int pageNum = 1;

  //获取活动列表
  getActivityList() async {
    if (isEnd) {
      return;
    }
    var formData = {'pageNum': pageNum};
    await requestGet('getActivityList', formData: formData).then((val) {
      activitydata = ActivityModel.fromJson(val);
      list.addAll(activitydata.data.pageInfo.list);
      isEnd = activitydata.data.pageInfo.isLastPage;
      notifyListeners();
    });
  }
}
