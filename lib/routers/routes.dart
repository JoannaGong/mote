import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String searchDetail = '/searchDetail'; //搜索页面
  static String modelDetail = '/modelDetail'; //模特详情页
  static String activity = '/activity'; //活动报名页
  static String activityDetail = '/activityDetail'; //活动报名详情页
  static String activityForm = '/activityForm'; //报名活动信息页
  static String activityPay = '/activityPay'; //报名活动支付页
  static String login = '/login'; //登录注册页
  static String setup = '/setup';  // 设置个人信息
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String, dynamic> params){
        print('无路由');
      }
    );

    router.define(searchDetail,handler: searchHandler);
    router.define(modelDetail,handler: modelDetailHandler);
    router.define(activity,handler: activityPageHandler);
    router.define(activityDetail,handler: activityDetailPageHandler);
    router.define(activityForm,handler: activityFormPageHandler);
    router.define(activityPay,handler: activityPayPageHandler);
    router.define(login,handler: loginPageHandler);
    router.define(setup,handler: setupHandler);
  }
}