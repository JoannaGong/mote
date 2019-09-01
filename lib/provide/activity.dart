import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../model_data/activity/activity_data.dart';
import '../model_data/activity/activityDetail_data.dart';
import '../pages/common/toast.dart';
import '../main.route.dart';

class ActivityProvide with ChangeNotifier {
  ActivityModel activitydata;
  ActivityDetailModel activityDetaildata;
  List<ActivityList> list = [];
  int pageNum = 1;

  String id = '';
  String name = '';
  String contact = '';
  String companyName = '';
  String note = '';

  //获取活动列表
  getActivityList(bool type) async {
    if (type) {
      pageNum++;
    } else {
      pageNum = 1;
    }

    var formData = {'pageNum': pageNum};
    await requestGet('getActivityList', formData: formData).then((val) {
      activitydata = ActivityModel.fromJson(val);
      if (type) {
        if (!activitydata.data.pageInfo.isLastPage) {
          list.addAll(activitydata.data.pageInfo.list);
          pageNum++;
        } else {
          showToast('无更多数据');
        }
      } else {
        list = activitydata.data.pageInfo.list;
      }
      notifyListeners();
    });
  }

  //活动详情
  getActivityDetail(String id) async {
    await requestGetDetail('getActivityList', id: id).then((val) {
      activityDetaildata = ActivityDetailModel.fromJson(val);
      notifyListeners();
    });
  }

  //报名
  activityGuest(BuildContext context) async {
    var formData = {
      'activityId': id,
      'name': name,
      'contact': contact,
      'companyName': companyName,
      'note': note
    };
    if (name == '') {
      showToast('姓名不能为空');
      return;
    }
    var phoneReg = RegExp(
        r"(((13[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[3-8]{1})|(18[0-9]{1})|(19[0-9]{1})|(14[5-7]{1}))+\d{8})");
    if (!phoneReg.hasMatch(contact)) {
      showToast('请输入正确手机号码');
      return;
    }
    await requestPost('activityGuest', formData: formData, context: context)
        .then((response) {
      // if(response['code']){}
      Navigator.of(context).pushNamed(ROUTE_ACTIVITY_PAY_PAGE, arguments: "$id");
    });
  }
}
