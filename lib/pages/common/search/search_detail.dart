import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:route_annotation/route_annotation.dart';

@RoutePage()
class SearchDetail extends StatelessWidget {
  const SearchDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        title: _search(context),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[HotSearch(), History()],
        ),
      ),
    );
  }

  //搜索栏
  Widget _search(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              //修饰黑色背景与圆角
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: _buildTextField(context)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              '取消',
              style: TextStyle(
                  color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28)),
            ),
          ),
        )
      ],
    );
  }

  //文本框
  Widget _buildTextField(context) {
    return TextField(
      cursorColor: Color(0xFF999999), //设置光标
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 0.0),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Color(0xFFDBDBDB),
          ),
          hintText: "您需要找什么",
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF999999))),
      style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
    );
  }
}

//热门搜索
class HotSearch extends StatelessWidget {
  const HotSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_hotSearchTitle(), _hotTip()],
      ),
    );
  }

  Widget _hotSearchTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('热门搜索',
          style: TextStyle(
              color: Color(0xFF999999), fontSize: ScreenUtil().setSp(24))),
    );
  }

  Widget _hotTip() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: _tipItem(),
    );
  }

  Widget _tipItem() {
    return Container(
      width: ScreenUtil().setWidth(128),
      height: ScreenUtil().setHeight(58),
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color(0xFFFFAF3B))),
      child: Text(
        '男模',
        style: TextStyle(
            color: Color(0xFFFFAF3B), fontSize: ScreenUtil().setSp(24)),
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[_historyTitle(), _historyTip()],
      ),
    );
  }

  Widget _historyTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('历史搜索',
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: ScreenUtil().setSp(24))),
          ),
          Container(
            child: GestureDetector(
              child: Text('清除',
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: ScreenUtil().setSp(24))),
            ),
          )
        ],
      ),
    );
  }

  Widget _historyTip() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: _tipItem(),
    );
  }

  Widget _tipItem() {
    return Container(
      width: ScreenUtil().setWidth(128),
      height: ScreenUtil().setHeight(58),
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color(0xFFBDBDBD))),
      child: Text(
        '男模',
        style: TextStyle(
            color: Color(0xFF777777), fontSize: ScreenUtil().setSp(24)),
      ),
    );
  }
}
