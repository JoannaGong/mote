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
      ..._searchDetail.entries,
      ..._modelDetail.entries,
      ..._loginPage.entries,
    ])[settings.name](settings);

Map<String, RouteFactory> _shootSiteDetailPage = <String, RouteFactory>{
  'shoot_site_detail_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ShootSiteDetailPage(),
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
