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
  static String shootSite = '/shootSite';  // 设置个人信息
  static String setUserInfo = '/setUserInfo';  // 编辑个人信息
  static String aboutUs = '/aboutUs';  // 设置 - 关于我们
  static String contactUs = '/contactUs';  // 设置 - 联系我们
  static String accountSafe = '/accountSafe';  // 设置 - 账户安全
  static String bindTelephone = '/bindTelephone';  // 设置 - 绑定手机号
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
    router.define(shootSite,handler: shootSitePageHandler);
    router.define(setUserInfo,handler: setUserInfoHandler);
    router.define(aboutUs,handler: aboutUsHandler);
    router.define(contactUs,handler: contactUsHandler);
    router.define(accountSafe,handler: accountSafeHandler);
    router.define(bindTelephone,handler: bindTelephoneHandler);
  }
}