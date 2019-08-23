import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';
import 'package:provide/provide.dart';
import './provide/current_index.dart';
import './provide/home.dart';
import './provide/model.dart';
import './provide/login.dart';
import './provide/activity.dart';

void main() {
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  var homeProvide = HomeProvide();
  var modelProvide = ModelProvide();
  var loginProvide = LoginProvide();
  var activityProvide = ActivityProvide();

  providers..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  providers..provide(Provider<HomeProvide>.value(homeProvide));
  providers..provide(Provider<ModelProvide>.value(modelProvide));
  providers..provide(Provider<LoginProvide>.value(loginProvide));
  providers..provide(Provider<ActivityProvide>.value(activityProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: 'model',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}
