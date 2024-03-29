import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/common/search/search_detail.dart';
import '../pages/model/model_detail.dart';
import '../pages/activity/activity_page.dart';
import '../pages/activity/activityDetail_page.dart';
import '../pages/activity/activity_form.dart';
import '../pages/activity/activity_pay.dart';
import '../pages/login/login_page.dart';
import '../pages/member/setup/set_up.dart';
import '../pages/shootSite/shoot_site.dart';
import '../pages/member/setup/set_user_info.dart';
import '../pages/member/setup/about_us.dart';
import '../pages/member/setup/contact_us.dart';
import '../pages/member/setup/account_safe.dart';
import '../pages/member/setup/bind_telephone.dart';
import '../pages/member/setup/change_telephone.dart';
import '../pages/member/setup/change_finish.dart';
import '../pages/member/setup/set_name.dart';
import '../pages/member/setup/set_area.dart';
import '../pages/shootSite/shoot_site_detail.dart';
import '../pages/member/member_page.dart';
import '../pages/member/certification/certification_merchant.dart';
import '../pages/member/certification/certification_merchant_no_identify.dart';
import '../pages/member/certification/certification_model.dart';
import '../pages/member/certification/certification_company.dart';
import '../pages/member/certification/merchant_person.dart';
import '../pages/member/certification/certification_ok.dart';
import '../pages/member/certification/merchant_company.dart';
import '../pages/member/certification/model_info.dart';

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

Handler activityPayPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String activityId = params['id'].first;
  return ActivityPayPage(id: activityId);
});

Handler loginPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
});

Handler setupHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SetUp();
});

Handler shootSitePageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ShootSitePage();
});

Handler setUserInfoHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SetUserInfo();
});

Handler aboutUsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AboutUs();
});

Handler contactUsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ContactUs();
});

Handler accountSafeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AccountSafe();
});

Handler bindTelephoneHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BindTelephone();
});

Handler changeTelephoneHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ChangeTelephone();
});

Handler changeFinishHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ChangeFinish();
});

Handler setNameHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SetName();
});

Handler setAreaHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SetArea();
});

Handler shootSiteDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String shootId = params['id'].first;
  return ShootSiteDetailPage(
    id: shootId,
  );
});

Handler memberHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MemberPage();
});

Handler certificationMerchantHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CertificationMerchant();
});

Handler certificationNoIdentifyHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CertificationNoIdentify();
});

Handler certificationModelHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CertificationModel();
});

Handler certificationCompanyHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CertificationCompany();
});

Handler merchantCompanyHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantCompany();
});

Handler merchantPersonHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MerchantPerson();
});

Handler certificationOkHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CertificationOk();
});

Handler modelInfoHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ModelInfo();
});