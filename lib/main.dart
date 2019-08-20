import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';
import 'package:provide/provide.dart';
import './provide/home.dart';


void main(){
  var providers = Providers();
  var homeProvide = HomeProvide();

  providers
  ..provide(Provider<HomeProvide>.value(homeProvide));

  runApp(ProviderNode(child: MyApp(),providers: providers));
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
          primarySwatch: Colors.grey,
        ),
        home: IndexPage(),
      ),
    );
  }
}