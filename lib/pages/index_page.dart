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
  final List<BottomNavigationBarItem> bottomTabs=[
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('模特')
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.shopping_cart,
        color: Colors.white,
      ),
      title: Text('发布')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('消息')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的')
    )
  ];

  final List tabBodies = [
    HomePage(),
    ModelPage(),
    IssuePage(),
    MessagePage(),
    MemberPage()
  ];
  int currentIndex =0;
  var currentPage;

@override
  void initState() {
    currentPage=tabBodies[currentIndex];
    super.initState();
  }
void _onAdd(){
    setState(() {
      currentIndex=2;
      currentPage=tabBodies[currentIndex];
    });
  }  

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375,height: 812)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 86, 88, 1),
          onPressed: _onAdd,
          child: Icon(Icons.add, color: Colors.white),
          elevation: 0,
          //tooltip: "发布", // 常按显示提``示
          heroTag: null, // 去除系统默认动画效果
          highlightElevation: 0,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 添加按钮位置
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}