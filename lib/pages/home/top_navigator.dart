import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../routers/application.dart';
import '../../main.route.dart';

import '../../provide/home.dart';
import '../../provide/main.dart';
import '../../provide/current_index.dart';

//顶部导航栏
class TopNavigator extends StatelessWidget {
  const TopNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, val) {
        var navigatorList = Provide.value<HomeProvide>(context)
            .navigatorData
            .data
            .homeModuleList;
        return Container(
            height: ScreenUtil().setHeight(180),
            padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
            margin: EdgeInsets.only(top: 10.0),
            child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                padding: EdgeInsets.all(4.0),
                children: navigatorList.map((item) {
                  return _gridViewItemUI(context, item);
                }).toList()));
      },
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return GestureDetector(
      onTap: () {
        // if(Provide.value<MainProvide>(context).token != ''){
        //   Application.router.navigateTo(context, "/activity", transition: TransitionType.inFromRight);
        // }else{
        //   Application.router.navigateTo(context, "/login");
        // }
        switch (item.routingUrl) {
          case 'mote':
            Provide.value<CurrentIndexProvide>(context).changeIndex(1);
            break;
          case 'ROUTE_SHOOT_SITE_PAGE':
            Navigator.of(context).pushNamed(
              ROUTE_SHOOT_SITE_PAGE,
            );
            break;
          case 'ROUTE_ACTIVITY_PAGE':
            Navigator.of(context).pushNamed(
              ROUTE_ACTIVITY_PAGE,
            );
            break;
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Image.network(
              item.iconUrl,
              width: ScreenUtil().setWidth(108),
              height: ScreenUtil().setHeight(108),
            ),
          ),
          Text(
            item.name,
            style: TextStyle(fontSize: ScreenUtil().setSp(24)),
          )
        ],
      ),
    );
  }
}
