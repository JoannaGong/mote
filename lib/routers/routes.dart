import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';
import '../pages/notFound/not_found.dart';

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
  static String shootSite = '/shootSite';  // 拍摄圣地
  static String shootSiteDetail = '/shootSiteDetail';  // 拍摄圣地详情
  static String setUserInfo = '/setUserInfo';  // 编辑个人信息
  static String aboutUs = '/aboutUs';  // 设置 - 关于我们
  static String contactUs = '/contactUs';  // 设置 - 联系我们
  static String accountSafe = '/accountSafe';  // 设置 - 账户安全
  static String bindTelephone = '/bindTelephone';  // 设置 - 绑定手机号
  static String changeTelephone = '/changeTelephone';  // 设置 - 更换手机号
  static String changeFinish = '/changeFinish';  // 设置 - 更换成功
  static String setName = '/setName';  // 设置 - 设置名字
  static String setArea = '/setArea';  // 设置 - 设置地区
  static String member = '/member';  // 我的
  static String certificationMerchant = '/certificationMerchant';  // 认证商家
  static String certificationNoIdentify = '/certificationNoIdentify';  // 认证其他
  static String certificationModel = '/certificationModel';  // 认证艺人
  static String certificationCompany = '/certificationCompany';  // 认证经纪
  static String merchantCompany = '/merchantCompany';  // 认证商家 - 企业
  static String merchantPerson = '/merchantPerson';  // 认证商家 - 个人
  static String certificationOk = '/certificationOk';  // 认证信息提交成功
  static String modelInfo = '/modelInfo';  // 艺人认证 - 模特信息

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String, dynamic> params){
        return NotFoundPage();
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
    router.define(changeTelephone,handler: changeTelephoneHandler);
    router.define(setName,handler: setNameHandler);
    router.define(setArea,handler: setAreaHandler);
    router.define(shootSiteDetail,handler: shootSiteDetailHandler);
    router.define(member, handler: memberHandler);
    router.define(certificationMerchant, handler: certificationMerchantHandler);
    router.define(certificationNoIdentify, handler: certificationNoIdentifyHandler);
    router.define(certificationModel, handler: certificationModelHandler);
    router.define(certificationCompany, handler: certificationCompanyHandler);
    router.define(merchantCompany, handler: merchantCompanyHandler);
    router.define(merchantPerson, handler: merchantPersonHandler);
    router.define(certificationOk, handler: certificationOkHandler);
    router.define(modelInfo, handler: modelInfoHandler);
  }
}