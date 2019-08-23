import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/common/search/search_detail.dart';
import '../pages/model/model_detail.dart';
import '../pages/activity/activity_page.dart';

Handler searchHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchDetail();
});

Handler modelDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String goodsId = params['id'].first;
  return ModelDetail(id: goodsId);
});

Handler activityPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ActivityPage();
});

