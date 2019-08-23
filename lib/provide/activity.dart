import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/activity/activity_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivityProvide with ChangeNotifier {
  ActivityModel activitydata;
  List<ActivityList> list = [];
  int pageNum = 1;

  //获取活动列表
  getActivityList(bool type) async {
    var formData = {'pageNum': pageNum};
    await requestGet('getActivityList', formData: formData).then((val) {
      activitydata = ActivityModel.fromJson(val);
      if (type) {
        if(!activitydata.data.pageInfo.isLastPage){
          list.addAll(activitydata.data.pageInfo.list);
          pageNum++;
        }else{
          Fluttertoast.showToast(
              msg: "无更多数据",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0
          );
        }
      } else {
        list = activitydata.data.pageInfo.list;
        pageNum = 1;
      }
      notifyListeners();
    });
  }
}
