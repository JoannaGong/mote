import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/home/search_detail.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, dynamic> params){
    return SearchDetail();
  }
);