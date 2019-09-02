import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/login/login_page.dart';
import 'package:provide/provide.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:route_annotation/route_annotation.dart';

import '../provide/current_index.dart';
import '../provide/main.dart';
import './home/home_page.dart';
import './model/model_page.dart';
import './issue/issue_page.dart';
import './message/message_page.dart';
import './member/member_page.dart';
import '../provide/login.dart';
import '../main.route.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();

@RoutePage(isInitialRoute: true)
class IndexPage extends StatelessWidget {
  final List<Widget> tabBodies = [
    HomePage(),
    ModelPage(),
    IssuePage(),
    MessagePage(),
    MemberPage()
  ];

  List<String> titles = ['首页', '模特', '发布', '消息', '我的'];
  List<String> icons = ['home', 'model', 'home', 'message', 'mine'];

  @override
  Widget build(BuildContext context) {
    _getToken(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1624)..init(context);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        var currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: Builder(builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(40)),
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFFAFAFA),
                  onPressed: () {
                    _onAdd(context);
                  },
                  child: Image.asset('assets/images/add.png'),
                  elevation: 0,
                  //tooltip: "发布", // 常按显示提``示
                  heroTag: null, // 去除系统默认动画效果
                  highlightElevation: 0,
                ),
              );
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked, // 添加按钮位置
            bottomNavigationBar: _bottomNavigationBar(context, titles, icons),
            body: IndexedStack(
              index: currentIndex,
              children: tabBodies,
            ));
      },
    );
  }

  _getToken(BuildContext context) {
    Future<String> token = Provide.value<MainProvide>(context).get('token');
    token.then((String token) {
      if (token != null) {
        Provide.value<MainProvide>(context).changeToken(token); // 保存token
      }
    });
  }

  BottomNavigationBar _bottomNavigationBar(
      BuildContext context, List<String> titles, List<String> icons) {
    return BottomNavigationBar(
      items: [
        _bottomBarItem(context, titles[0], icons[0]),
        _bottomBarItem(context, titles[1], icons[1]),
        _bottomBarItem(context, titles[2], icons[2]),
        _bottomBarItem(context, titles[3], icons[3]),
        _bottomBarItem(context, titles[4], icons[4]),
      ],
      currentIndex: Provide.value<CurrentIndexProvide>(context).currentIndex,
      type: BottomNavigationBarType.fixed, // 当items大于3时需要设置此类型
      onTap: (index) {
        // Provide.value<CurrentIndexProvide>(context).changeIndex(index);
        if (index == 4) {
          var token = Provide.value<MainProvide>(context).token;
          print('index_page: $token');
          if (token == '') {
            Navigator.of(context).pushNamed(ROUTE_LOGIN_PAGE);
          } else {
            Provide.value<CurrentIndexProvide>(context).changeIndex(4);
            // Application.router.navigateTo(context, "/member"); //, transition: TransitionType.inFromRight
            // Navigator.push(
            //   context, MaterialPageRoute(builder: (context) => MemberPage())
            // );
          }
        } else {
          Provide.value<CurrentIndexProvide>(context).changeIndex(index);
        }
      },
      selectedFontSize: 12,
    );
  }

  // 创建item
  BottomNavigationBarItem _bottomBarItem(
    BuildContext context,
    String title,
    String iconName,
  ) {
    return BottomNavigationBarItem(
      icon: _image(iconName),
      title: Text(title),
      activeIcon: _image('${iconName}_selected'),
      backgroundColor: Colors.white,
    );
  }

  //image
  Widget _image(String iconName) {
    return Image.asset(
      'assets/images/${iconName}.png',
      width: 20,
      height: 20,
    );
  }

  void _onAdd(BuildContext context) {
    Provide.value<CurrentIndexProvide>(context).changeIndex(2);
  }
}
