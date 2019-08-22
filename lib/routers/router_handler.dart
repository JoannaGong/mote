import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/common/search/search_detail.dart';

Handler searchHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, dynamic> params){
    return SearchDetail();
  }
);