import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _buildTextField(BuildContext context) {
    return TextField(
      cursorColor: Color(0xFF999999), //设置光标
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 0.0),
          border: InputBorder.none,
          icon: Icon(Icons.search,color: Color(0xFFDBDBDB),),
          hintText: "您需要找什么",
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF999999))),
      style:
          TextStyle(fontSize: 14, color: Color(0xFF999999)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //修饰黑色背景与圆角
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: _buildTextField(context));
  }
}
