import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String, dynamic> params){
        print('无路由');
      }
    );

    router.define(detailsPage,handler: detailsHandler);
  }
}