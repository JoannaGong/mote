// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:mote/pages/shootSite/shoot_site_detail.dart';
import 'package:mote/pages/shootSite/shoot_site.dart';
import 'package:mote/pages/activity/activity_page.dart';
import 'package:mote/pages/activity/activity_form.dart';
import 'package:mote/pages/activity/activityDetail_page.dart';
import 'package:mote/pages/activity/activity_pay.dart';
import 'package:mote/pages/index_page.dart';
import 'package:mote/pages/member/member_page.dart';
import 'package:mote/pages/member/setup/contact_us.dart';
import 'package:mote/pages/member/setup/change_telephone.dart';
import 'package:mote/pages/member/setup/account_safe.dart';
import 'package:mote/pages/member/setup/set_up.dart';
import 'package:mote/pages/member/setup/set_area.dart';
import 'package:mote/pages/member/setup/bind_telephone.dart';
import 'package:mote/pages/member/setup/set_name.dart';
import 'package:mote/pages/member/setup/change_finish.dart';
import 'package:mote/pages/member/setup/about_us.dart';
import 'package:mote/pages/member/setup/set_user_info.dart';
import 'package:mote/pages/member/certification/certification_company.dart';
import 'package:mote/pages/member/certification/merchant_person.dart';
import 'package:mote/pages/member/certification/certification_merchant.dart';
import 'package:mote/pages/member/certification/certification_model.dart';
import 'package:mote/pages/member/certification/certification_merchant_no_identify.dart';
import 'package:mote/pages/member/certification/model_info.dart';
import 'package:mote/pages/member/certification/merchant_company.dart';
import 'package:mote/pages/member/certification/certification_ok.dart';
import 'package:mote/pages/common/webView_page.dart';
import 'package:mote/pages/common/search/search_detail.dart';
import 'package:mote/pages/model/model_detail.dart';
import 'package:mote/pages/login/login_page.dart';

const ROUTE_SHOOT_SITE_DETAIL_PAGE = 'shoot_site_detail_page';
const ROUTE_SHOOT_SITE_PAGE = 'shoot_site_page';
const ROUTE_ACTIVITY_PAGE = 'activity_page';
const ROUTE_ACTIVITY_FORM = 'activity_form';
const ROUTE_ACTIVITY_DETAIL_PAGE = 'activity_detail_page';
const ROUTE_ACTIVITY_PAY_PAGE = 'activity_pay_page';
const ROUTE_HOME = '/';
const ROUTE_MEMBER_PAGE = 'member_page';
const ROUTE_CONTACT_US = 'contact_us';
const ROUTE_CHANGE_TELEPHONE = 'change_telephone';
const ROUTE_ACCOUNT_SAFE = 'account_safe';
const ROUTE_SET_UP = 'set_up';
const ROUTE_SET_AREA = 'set_area';
const ROUTE_BIND_TELEPHONE = 'bind_telephone';
const ROUTE_SET_NAME = 'set_name';
const ROUTE_CHANGE_FINISH = 'change_finish';
const ROUTE_ABOUT_US = 'about_us';
const ROUTE_SET_USER_INFO = 'set_user_info';
const ROUTE_CERTIFICATION_COMPANY = 'certification_company';
const ROUTE_MERCHANT_PERSON = 'merchant_person';
const ROUTE_CERTIFICATION_MERCHANT = 'certification_merchant';
const ROUTE_CERTIFICATION_MODEL = 'certification_model';
const ROUTE_CERTIFICATION_NO_IDENTIFY = 'certification_no_identify';
const ROUTE_MODEL_INFO = 'model_info';
const ROUTE_MERCHANT_COMPANY = 'merchant_company';
const ROUTE_CERTIFICATION_OK = 'certification_ok';
const ROUTE_WEB_VIEW_PAGE = 'web_view_page';
const ROUTE_SEARCH_DETAIL = 'search_detail';
const ROUTE_MODEL_DETAIL = 'model_detail';
const ROUTE_LOGIN_PAGE = 'login_page';

RouteFactory onGenerateRoute = (settings) => Map.fromEntries([
      ..._shootSiteDetailPage.entries,
      ..._shootSitePage.entries,
      ..._activityPage.entries,
      ..._activityForm.entries,
      ..._activityDetailPage.entries,
      ..._activityPayPage.entries,
      ..._home.entries,
      ..._memberPage.entries,
      ..._contactUs.entries,
      ..._changeTelephone.entries,
      ..._accountSafe.entries,
      ..._setUp.entries,
      ..._setArea.entries,
      ..._bindTelephone.entries,
      ..._setName.entries,
      ..._changeFinish.entries,
      ..._aboutUs.entries,
      ..._setUserInfo.entries,
      ..._certificationCompany.entries,
      ..._merchantPerson.entries,
      ..._certificationMerchant.entries,
      ..._certificationModel.entries,
      ..._certificationNoIdentify.entries,
      ..._modelInfo.entries,
      ..._merchantCompany.entries,
      ..._certificationOk.entries,
      ..._webViewPage.entries,
      ..._searchDetail.entries,
      ..._modelDetail.entries,
      ..._loginPage.entries,
    ])[settings.name](settings);

Map<String, RouteFactory> _shootSiteDetailPage = <String, RouteFactory>{
  'shoot_site_detail_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) =>
            ShootSiteDetailPage(id: settings.arguments),
      ),
};
Map<String, RouteFactory> _shootSitePage = <String, RouteFactory>{
  'shoot_site_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ShootSitePage(),
      ),
};
Map<String, RouteFactory> _activityPage = <String, RouteFactory>{
  'activity_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ActivityPage(),
      ),
};
Map<String, RouteFactory> _activityForm = <String, RouteFactory>{
  'activity_form': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ActivityForm(id: settings.arguments),
      ),
};
Map<String, RouteFactory> _activityDetailPage = <String, RouteFactory>{
  'activity_detail_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) =>
            ActivityDetailPage(id: settings.arguments),
      ),
};
Map<String, RouteFactory> _activityPayPage = <String, RouteFactory>{
  'activity_pay_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) =>
            ActivityPayPage(id: settings.arguments),
      ),
};
Map<String, RouteFactory> _home = <String, RouteFactory>{
  '/': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => IndexPage(),
      ),
};
Map<String, RouteFactory> _memberPage = <String, RouteFactory>{
  'member_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => MemberPage(),
      ),
};
Map<String, RouteFactory> _contactUs = <String, RouteFactory>{
  'contact_us': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ContactUs(),
      ),
};
Map<String, RouteFactory> _changeTelephone = <String, RouteFactory>{
  'change_telephone': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ChangeTelephone(),
      ),
};
Map<String, RouteFactory> _accountSafe = <String, RouteFactory>{
  'account_safe': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => AccountSafe(),
      ),
};
Map<String, RouteFactory> _setUp = <String, RouteFactory>{
  'set_up': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SetUp(),
      ),
};
Map<String, RouteFactory> _setArea = <String, RouteFactory>{
  'set_area': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SetArea(),
      ),
};
Map<String, RouteFactory> _bindTelephone = <String, RouteFactory>{
  'bind_telephone': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => BindTelephone(),
      ),
};
Map<String, RouteFactory> _setName = <String, RouteFactory>{
  'set_name': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SetName(),
      ),
};
Map<String, RouteFactory> _changeFinish = <String, RouteFactory>{
  'change_finish': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ChangeFinish(),
      ),
};
Map<String, RouteFactory> _aboutUs = <String, RouteFactory>{
  'about_us': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => AboutUs(),
      ),
};
Map<String, RouteFactory> _setUserInfo = <String, RouteFactory>{
  'set_user_info': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SetUserInfo(),
      ),
};
Map<String, RouteFactory> _certificationCompany = <String, RouteFactory>{
  'certification_company': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CertificationCompany(),
      ),
};
Map<String, RouteFactory> _merchantPerson = <String, RouteFactory>{
  'merchant_person': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => MerchantPerson(),
      ),
};
Map<String, RouteFactory> _certificationMerchant = <String, RouteFactory>{
  'certification_merchant': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CertificationMerchant(),
      ),
};
Map<String, RouteFactory> _certificationModel = <String, RouteFactory>{
  'certification_model': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CertificationModel(),
      ),
};
Map<String, RouteFactory> _certificationNoIdentify = <String, RouteFactory>{
  'certification_no_identify': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CertificationNoIdentify(),
      ),
};
Map<String, RouteFactory> _modelInfo = <String, RouteFactory>{
  'model_info': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ModelInfo(),
      ),
};
Map<String, RouteFactory> _merchantCompany = <String, RouteFactory>{
  'merchant_company': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => MerchantCompany(),
      ),
};
Map<String, RouteFactory> _certificationOk = <String, RouteFactory>{
  'certification_ok': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CertificationOk(),
      ),
};
Map<String, RouteFactory> _webViewPage = <String, RouteFactory>{
  'web_view_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => WebViewPage(url: settings.arguments),
      ),
};
Map<String, RouteFactory> _searchDetail = <String, RouteFactory>{
  'search_detail': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SearchDetail(),
      ),
};
Map<String, RouteFactory> _modelDetail = <String, RouteFactory>{
  'model_detail': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ModelDetail(id: settings.arguments),
      ),
};
Map<String, RouteFactory> _loginPage = <String, RouteFactory>{
  'login_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
};
