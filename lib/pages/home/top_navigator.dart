import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../routers/application.dart';

import '../../provide/home.dart';
import '../../provide/main.dart';


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
        Application.router.navigateTo(context, "/shootSite", transition: TransitionType.inFromRight);
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