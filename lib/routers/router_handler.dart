import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/common/search/search_detail.dart';
import '../pages/model/model_detail.dart';
import '../pages/activity/activity_page.dart';
import '../pages/activity/activityDetail_page.dart';
import '../pages/activity/activity_form.dart';
import '../pages/login/login_page.dart';
import '../pages/member/setup/set_up.dart';

Handler searchHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchDetail();
});

Handler modelDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String modelId = params['id'].first;
  return ModelDetail(id: modelId);
});

Handler activityPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ActivityPage();
});

Handler activityDetailPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String activityId = params['id'].first;
  return ActivityDetailPage(id: activityId);
});

Handler activityFormPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String activityId = params['id'].first;
  return ActivityForm(id: activityId);
});

Handler loginPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
});

Handler setupHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SetUp();
});
