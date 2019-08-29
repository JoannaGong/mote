import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetSex extends StatefulWidget {
  @override
  _SetSexState createState() => _SetSexState();
}

class _SetSexState extends State<SetSex> {
  final TextEditingController _controller = new TextEditingController();
  var sex;

  @override
  Widget build(BuildContext context) {
    sex = '女';
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('设置性别',
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
              print('$sex');
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
            hintText: '$sex'
          ),
          onChanged: (val){
            sex = val;
          },
        ),
      ),
    );
  }
}
