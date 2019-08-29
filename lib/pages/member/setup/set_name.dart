import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetName extends StatefulWidget {
  @override
  _SetNameState createState() => _SetNameState();
}

class _SetNameState extends State<SetName> {
  final TextEditingController _controller = new TextEditingController();
  var userName;

  @override
  Widget build(BuildContext context) {
    userName = '金闪闪';
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('设置名字',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: ScreenUtil().setSp(34),
            fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          RaisedButton(
            onPressed: (){
              print('$userName');
            },
            child: Text('保存', style: TextStyle(color: Color(0xFFFF5658), fontSize: ScreenUtil().setSp(32)),),
            color: Colors.transparent,
            elevation: 0,
          )
        ],
      ),
      body: Container(
        color: Color(0xFFFFFFFF),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
        child: TextField(
          controller: _controller,
          style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Color(0xFF333333)),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '$userName'
          ),
          onChanged: (val){
            userName = val;
          },
        ),
      ),
    );
  }
}
