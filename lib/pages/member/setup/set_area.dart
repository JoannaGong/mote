import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../../provide/login.dart';

var userInfo;

class SetArea extends StatefulWidget {
  @override
  _SetAreaState createState() => _SetAreaState();
}

class _SetAreaState extends State<SetArea> {
  var area;
  List<int> items = List.generate(10, (i) => i);

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(Provide?.value<LoginProvide>(context)?.userData?.data != null){
      userInfo = Provide.value<LoginProvide>(context).userData.data.userInfo;
    }
    area = '${userInfo.areaId}';
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
        child: ListView.builder(
          // itemBuilder: items.length,
          // itemBuilder: (context, index){
          //   return ListTile(title: Text("Number $index"));
          // },
        )
      ),
    );
  }
}
