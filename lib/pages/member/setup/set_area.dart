import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetArea extends StatefulWidget {
  @override
  _SetAreaState createState() => _SetAreaState();
}

class _SetAreaState extends State<SetArea> {
  final TextEditingController _controller = new TextEditingController();
  var area;

  @override
  Widget build(BuildContext context) {
    area = '新加坡';
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('设置地区',
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
              print('$area');
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
            hintText: '$area'
          ),
          onChanged: (val){
            area = val;
          },
        ),
      ),
    );
  }
}
