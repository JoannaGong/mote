import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/login/login_page.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provide/current_index.dart';
import '../provide/main.dart';

import './home/home_page.dart';
import './model/model_page.dart';
import './issue/issue_page.dart';
import './message/message_page.dart';
import './member/member_page.dart';
import '../provide/login.dart';

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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1624)..init(context);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        var currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
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

  BottomNavigationBar _bottomNavigationBar(
    BuildContext context, List<String> titles, List<String> icons) {
    Future<String> get() async {
      var token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString(token);
      return token;
    }
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
        Provide.value<CurrentIndexProvide>(context).changeIndex(index);
        if (index == 4) {
          Future<String> token = get();
          token.then((String token){
            if(token == null){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage())
              );
            }else{
              Provide.value<LoginProvide>(context).getUserInfo(token); // 请求用户数据
              Provide.value<MainProvide>(context).token = token; // 保存token
            }
          });
        }
      },
      selectedFontSize: 12,
    );
  }

  // 创建item
  BottomNavigationBarItem _bottomBarItem(BuildContext context,
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