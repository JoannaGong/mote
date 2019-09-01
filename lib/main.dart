import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import 'package:route_annotation/route_annotation.dart';

import './provide/current_index.dart';
import './provide/main.dart';
import './provide/home.dart';
import './provide/model.dart';
import './provide/login.dart';
import './provide/activity.dart';
import './provide/shoot_site.dart';

import './pages/index_page.dart';
import './main.route.dart';
// import './routers/routes.dart';
// import './routers/application.dart';

void main() {
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  var mainProvide = MainProvide();
  var homeProvide = HomeProvide();
  var modelProvide = ModelProvide();
  var loginProvide = LoginProvide();
  var activityProvide = ActivityProvide();
  var shootSiteProvide = ShootSiteProvide();

  providers..provide(Provider<MainProvide>.value(mainProvide));
  providers..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  providers..provide(Provider<HomeProvide>.value(homeProvide));
  providers..provide(Provider<ModelProvide>.value(modelProvide));
  providers..provide(Provider<LoginProvide>.value(loginProvide));
  providers..provide(Provider<ActivityProvide>.value(activityProvide));
  providers..provide(Provider<ShootSiteProvide>.value(shootSiteProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

@Router()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final router = Router();
    // Routes.configureRoutes(router);
    // Application.router = router;

    return Container(
      child: MaterialApp(
        // onGenerateRoute: Application.router.generator,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        onGenerateRoute: onGenerateRoute,
        home: IndexPage(),
      ),
    );
  }
}
