import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home/home_page.dart';
import './model/model_page.dart';
import './issue/issue_page.dart';
import './message/message_page.dart';
import './member/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<Widget> tabBodies = [
    HomePage(),
    ModelPage(),
    IssuePage(),
    MessagePage(),
    MemberPage()
  ];

  int currentIndex = 0;

  List<String> titles = ['首页', '模特', '发布', '消息', '我的'];
  List<String> icons = ['home', 'model', 'home','message' , 'mine'];

  @override
  void initState() {
    super.initState();
  }

  BottomNavigationBar _bottomNavigationBar(List <String>titles, List <String>icons){
    return  BottomNavigationBar(
      items: [
        _bottomBarItem(titles[0], icons[0]),
        _bottomBarItem(titles[1], icons[1]),
        _bottomBarItem(titles[2], icons[2]),
        _bottomBarItem(titles[3], icons[3]),
        _bottomBarItem(titles[4], icons[4]),
      ],
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,// 当items大于3时需要设置此类型
      onTap: _bottomBarItemClick,
      selectedFontSize: 12,
    );
  }
  // 创建item
  BottomNavigationBarItem _bottomBarItem(String title, String iconName,) {
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
  //item点击
  _bottomBarItemClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onAdd() {
    setState(() {
      currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1624)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Builder(builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(40)
          ),
          child: FloatingActionButton(
            backgroundColor: Color(0xFFFAFAFA),
            onPressed: _onAdd,
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
      bottomNavigationBar: _bottomNavigationBar(titles, icons),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
